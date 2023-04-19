#!/bin/bash

PKG=${1}

echo "#!/bin/bash" > ${PKG}.sh
echo "" >> ${PKG}.sh
echo "mkdir ${PKG}" >> ${PKG}.sh
echo "cd ${PKG}" >> ${PKG}.sh
echo "apt-get download \\" >> ${PKG}.sh

sudo echo -n ""
sudo apt-get install ${PKG} -y -q > f &
sleep 1
sudo pkill -9 apt 2>/dev/null

PKGS=($(cat f | \
    grep "The following NEW packages will be installed:" -A 1000 | \
    grep --invert-match "The following NEW packages will be installed:"))

rm f

for p in "${PKGS[@]}"
do
    echo "    ${p} \\" >> ${PKG}.sh
done

truncate -s-2 ${PKG}.sh

echo "" >> ${PKG}.sh
