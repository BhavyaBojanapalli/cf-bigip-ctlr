#!/bin/bash


set -e

CURDIR="$(dirname $BASH_SOURCE)"

. $CURDIR/_build-lib.sh

for pkg in $(all_pkgs); do
  test_pkg "$pkg"
done

go_install $(all_pkgs)

echo "Gathering unit test code coverage for 'release' build..."
gather_coverage
