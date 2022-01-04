#!/bin/bash

outfile=$HOME/bin/tryat.out

exec 3>> $outfile

echo "This script ran at $(date +%B%d,%T)" >&3
echo >&3
echo "This script is using the $SHELL shell" >&3
echo "This is the end of the script" >&3
exit

