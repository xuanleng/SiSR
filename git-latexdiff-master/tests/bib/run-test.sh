#!/bin/sh

die () {
    echo "fatal: $@"
    cleanup
    exit 1
}

cleanup () {
    perl -pi -e 's/Uncommited/New/g' test.tex test.bib
}

trap cleanup 2

cd "$(dirname "$0")"

perl -pi -e 's/New/Uncommited/g' test.tex test.bib
old=b9a200a6a0c45d6c594cb3c5473edd81a7edb52c
new=cbce899ba408849a471461bb9b5d648bf02039ef

rm -f *.aux *.bbl
echo "git latexdiff without --bbl option (should not display bibliography)"
../../git-latexdiff -v $old $new 2>&1 > no-bbl.log ||
	die "latexdiff without --bbl failed (log in no-bbl.log)."

rm -f *.aux *.bbl
echo "git latexdiff with --bbl option (should display diff within bibliography)"
../../git-latexdiff -v $old $new --bbl 2>&1 > with-bbl.log ||
	die "latexdiff with --bbl failed (log in with-bbl.log)."

rm -f *.aux *.bbl
echo "git latexdiff with --latexdiff-flatten option (should not display bibliography)"
../../git-latexdiff -v  $old $new --latexdiff-flatten 2>&1 > with-flatten.log ||
	die "latexdiff with --latexdiff-flatten failed (log in flatten.log)."

echo "git latexdiff --bbl against the working directory (should display new -> uncommited changes)"
../../git-latexdiff -v  --bbl HEAD -- 2>&1 > workdir.log ||
	die "git latexdiff --bbl against the working directory failed (log in workdir.log)."

cleanup

