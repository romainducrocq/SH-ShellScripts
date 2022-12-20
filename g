#!/bin/bash

urls=""
for URL in $( echo "${@}" | sed 's/ /\\ /g' )
do
	urls="${urls} ${URL}"
done

fx="sudo -u romain nohup firefox -search${urls} &> ~/nohup.out &"
#echo "${fx}"
eval "${fx}"
