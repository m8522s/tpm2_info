#!/bin/bash

# Show information about the local TPM chip in a readable format.
# This script is an inofficial enhancement to the tpm2-tools.

# Required packages: tpm2-tools opensc

MODULE=/usr/lib64/pkcs11/libtpm2_pkcs11.so


# Check for commands


# Get capabilities
tpm2_getcap properties-fixed

# Which ECC curves are possible?
tpm2_getcap ecc-curves


pkcs11-tool --module ${MODULE} --list-slots