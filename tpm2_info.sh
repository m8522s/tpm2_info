#!/bin/bash

# Show information about the local TPM chip in a readable format.
# This script is an inofficial enhancement to the tpm2-tools.

# Required packages: tpm2-tools opensc


# Path to local PKCS#11 library
MODULE=/usr/lib64/pkcs11/libtpm2_pkcs11.so


# Check if required commands exist
if ! command -v tpm2_getcap >/dev/null 2>&1 ; then
  echo "tpm2-tools not installed"
  exit 1
elif ! command -v pkcs11-tool >/dev/null 2>&1 ; then
  echo "opensc not installed"
  exit 2
fi


# Get capabilities
tpm2_getcap properties-fixed

# Which ECC curves are possible?
tpm2_getcap ecc-curves


pkcs11-tool --module ${MODULE} --list-slots
pkcs11-tool --module ${MODULE} --list-objects