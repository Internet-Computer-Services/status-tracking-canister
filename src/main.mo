import List "mo:base/List";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Error "mo:base/Error";
import Bool "mo:base/Bool";

actor {
  var authorizedIds = List.fromArray(["vblpp-bejrg-pegia-rujee-oechi-bunsx-ox5qo-c7y2e-rn73a-kpwbx-3qe", "dbsyz-2yaaa-aaaam-aajva-cai", "naxvf-nqxob-iipiq-ckoph-vu42e-dyjun-36b3c-6bs2p-pp23w-z367b-2ae"]);

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
