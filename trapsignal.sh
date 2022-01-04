#!/bin/bash

trap "echo ' Sorry! I have tracpped Ctrl-C'" SIGINT
echo This is  test script.
count=1
while [ $count -le 5 ]
do
	echo "Loop #$count"
	sleep 1
	count=$[ $count + 1 ]
done
echo "This is the end of test script"
exit

