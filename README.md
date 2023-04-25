# ICS STATUS TRACKING CANISTER

## How to deploy

```sh
export ARGUMENT='(vec {"<IDENTITY_PRINCIPAL>"; })'
dfx deploy --argument $ARGUMENT ics_status_tracking_canister #Replace <IDENTITY_PRINCIPAL> with your actual identity principal.
```

<br>

#### Deployed ICS Status canister's module hash: 9ec8f0225aee40810a90bbb81a8324580d8f78164889bae9b94cd2262db7d820

<br>

## How to verify module hash:

1. Get deployed ICS status tracking canister's module hash.
   - go to dfinity dashboard & search for identity of ICS status tracking canister.
   - deploy status canister locally:
     -> clone repo locally
     -> use above mentioned deploy commands to deploy canister.
   - to get module hash, run
     ```sh
     dfx canister status ics_status_tracking_canister
     ```
2. Compare both module hashes. both should be same
