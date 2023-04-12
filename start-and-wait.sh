#!/bin/bash

wait-for-it -t 0 localhost:8000 -- ./script.sh &
dfx start --clean --emulator
