# ICS STATUS TRACKING CANISTER

## How to deploy

```sh
export ARGUMENT='(vec {"<IDENTITY_PRINCIPAL>"; })'
dfx deploy --argument $ARGUMENT ics_status_tracking_canister #Replace <IDENTITY_PRINCIPAL> with your actual identity principal.
```

<br>

> Public Status Tracking Canister ID: *nz3sp-kiaaa-aaaag-abota-cai*

> Status Tracking Canister Candid: https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.ic0.app/?id=nz3sp-kiaaa-aaaag-abota-cai

> Status Tracking Canister: https://icscan.io/canister/nz3sp-kiaaa-aaaag-abota-cai

> IC Dashboard: https://dashboard.internetcomputer.org/canister/nz3sp-kiaaa-aaaag-abota-cai

<br>

#### Deployed ICS Status canister's module hash: 
c7d2e884da490ba2c87d10393c8c63d42739dedb3fd6b26cd60d0e3b2fdde067

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
