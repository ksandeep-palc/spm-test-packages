#!/bin/sh
# Print the spm manifest for version $1 on one line (it becomes a docker label).
# Fields mirror the throwaway tarball the sonic_test_automation suite builds on the DUT,
# which spm already installs successfully.
set -e
v="$1"
[ -n "$v" ] || { echo "usage: $0 <version>" >&2; exit 2; }
cat <<JSON | tr -d '\n'
{"package": {"name": "spmregpkg", "version": "$v",
 "description": "Test package for SONiC Package Manager CI (install/upgrade/versions from a registry)",
 "changelog": {"1.0.0": {"changes": ["Initial test package"], "author": "spm-test", "email": "spm-test@example.com", "date": "2026-09-28"},
               "1.1.0": {"changes": ["Upgrade target for spm upgrade tests"], "author": "spm-test", "email": "spm-test@example.com", "date": "2026-09-28"}}},
 "service": {"name": "spmregpkg", "host-service": true, "asic-service": false}}
JSON
