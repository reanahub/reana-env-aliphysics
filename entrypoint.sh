#!/bin/bash -e
# shellcheck disable=SC2048,SC2086
exec /cvmfs/alice.cern.ch/bin/alienv setenv AliPhysics/$ALIPHYSICS_VERSION -c $*
