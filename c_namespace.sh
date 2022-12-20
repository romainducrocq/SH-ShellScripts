#!/bin/bash

SRC="${1%.*}"

gcc -c -Wall ${SRC}.c

nm ${SRC}.o | grep --invert-match " U " | cut -d' ' -f3 > o.txt

echo -n '' > ${SRC}.hpp

echo '#ifndef _'"$(echo "${SRC}" | tr a-z A-Z)"'_HPP' >> ${SRC}.hpp
echo '#define _'"$(echo "${SRC}" | tr a-z A-Z)"'_HPP' >> ${SRC}.hpp
echo '' >> ${SRC}.hpp

while IFS="" read -r LINE || [ -n "$LINE" ]
do
    echo '#define '"${LINE}"' '"${SRC}"'_'"${LINE}" >> ${SRC}.hpp
done < o.txt

echo '' >> ${SRC}.hpp
echo '#include "'"${SRC}"'.h"' >> ${SRC}.hpp
echo '' >> ${SRC}.hpp

while IFS="" read -r LINE || [ -n "$LINE" ]
do
    echo '#undef '"${LINE}" >> ${SRC}.hpp
done < o.txt

echo '' >> ${SRC}.hpp
echo '#endif' >> ${SRC}.hpp

while IFS="" read -r LINE || [ -n "$LINE" ]
do
    objcopy --redefine-sym ${LINE}=${SRC}_${LINE} ${SRC}.o
done < o.txt

ar -rcs lib${SRC^}.a ${SRC}.o

rm o.txt ${SRC}.o
