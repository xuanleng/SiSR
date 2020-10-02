# awk -f addblanks.awk 2dspectra_random.ods > a.dat
BEGIN { FS = "," }
$1 != prev {printf "\n"; prev=$1} # print blank line  
{print} # print the line
