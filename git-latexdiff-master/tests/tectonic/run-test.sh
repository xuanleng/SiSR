#!/bin/sh

die () {
    echo "fatal: $*"
    exit 1
}

cd "$(dirname "$0")/../bib" || exit

old=b9a200a6a0c45d6c594cb3c5473edd81a7edb52c
new=cbce899ba408849a471461bb9b5d648bf02039ef

echo "git latexdiff with --tectonic should work"
../../git-latexdiff --tectonic -v $old $new > tectonic.log 2>&1 ||
	die "latexdiff with --tectonic failed."
