#!/bin/bash

echo "Script Process ID: $$"
count=1
while [ $count -le 5 ]
do
	echo "Loop #$count"
	sleep 5
	count=$[ $count + 1 ]
done
echo "End of the script"
exit
