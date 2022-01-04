#!/bin/bash

while getopts S: opt
do
	case $opt in
		S)
			signallist=""
			for arg in $OPTARG
			do
				case $arg in
					1)
						signallist=$signallist"SIGHUP ";;
					2)
						signallist=$signallist"SIGINT ";;
					20)
						signallist=$signallist"SIGTSTP ";;
					*)
						echo "Only signals 1 2 and/or 20 are allowed" >&2
						echo "Exiting Script"
						exit;;
				esac
			done;;
		*)
			echo 'Usage: -S Signal(s) script-to-run-name'
			exit;;
	esac
done

shift $[ $OPTIND - 1 ]
if [ -z $@ ]
then
	echo
	echo "Error: Script name not provided." >&2
	echo 'Usage: -S Signal(s) script-to-run-name'
	exit
elif [ -O $@ ] && [ -x $@ ]
then
	scriptToRun=$@
	scriptOutput="$@.out"
else
	echo "Error: $@ is either not owned by you or not executable."
	exit
fi

trap "" $signallist
source $scriptToRun >> $scriptOutput &
trap -- $signallist

exit
					
