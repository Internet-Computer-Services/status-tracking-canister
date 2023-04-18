import List "mo:base/List";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Error "mo:base/Error";
import Bool "mo:base/Bool";

shared (install) actor class ics_status_tracking_canister(authorizedIdList : List.List<Text>) = this {
  var authorizedIds : List.List<Text> = authorizedIdList;

  public type canister_id = Principal;

  public type definite_canister_settings = {
    freezing_threshold : Nat;
    controllers : [Principal];
    memory_allocation : Nat;
    compute_allocation : Nat;
  };

  public type canister_status = {
    status : { #stopped; #stopping; #running };
    memory_size : Nat;
    cycles : Nat;
    settings : definite_canister_settings;
    module_hash : ?[Nat8];
  };

  public type IC = actor {
    canister_status : { canister_id : canister_id } -> async canister_status;
  };

  let ic : IC = actor ("aaaaa-aa");

  // check if user is authorizaed or not
  private func verifyAuthorization(caller : Principal) : async () {
    let authorized = List.some<Text>(
      authorizedIds,
      func(id : Text) : Bool {
        return id == Principal.toText(caller);
      },
    );
    if (authorized == false) {
      throw Error.reject("Unauthorized");
    };
  };

  public shared ({ caller }) func canister_status(request : { canister_id : canister_id }) : async canister_status {
    await verifyAuthorization(caller);
    await ic.canister_status(request);
  };
};
