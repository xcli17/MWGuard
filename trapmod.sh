#!/bin/bash

trap "echo 'Ctrl-C is trapped'" SIGINT
count=1
while [ $count -le 3 ]
do
	echo "LOOP #$count"
	sleep 1
	count=$[ $count + 1 ]
done

trap "echo 'I have modified the trap!'" SIGINT
count=1
while [ $count -le 3 ]
do
	echo "Second LOOP #$count"
	sleep 1
	count=$[ $count + 1 ]
done

trap -- SIGINT
echo "The trap is removed"
count=1
while [ $count -le 3 ]
do
	echo "LOOP #$count"
	sleep 1
	count=$[ $count + 1 ]
done

exit
