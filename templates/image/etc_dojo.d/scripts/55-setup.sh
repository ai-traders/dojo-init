#!/bin/bash

set -Eeuo pipefail

###########################################################################
# This file ensures files are mapped from dojo_identity into dojo_home.
# Fails if any required secret or configuration file is missing.
###########################################################################

if [ -d "${dojo_identity}/.ssh" ]; then
  (set -x; cp -r "${dojo_identity}/.ssh" "${dojo_home}/" && chmod 700 "${dojo_home}/.ssh" && chown dojo:dojo -R "${dojo_home}/.ssh"; )
else
  echo "${dojo_identity}/.ssh does not exist. Ignoring that."
fi
