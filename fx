#!/bin/bash

urls=""
for URL in "${@}"
do
	urls="${urls} $( echo "${URL}" | sed 's/ /\\ /g' )"
done

fx="sudo -u romain nohup firefox${urls} &> ~/nohup.out &"
#echo "${fx}"
eval "${fx}"
