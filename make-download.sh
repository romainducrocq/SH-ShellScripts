#!/bin/bash

PKG=${1}

echo "#!/bin/bash" > ${PKG}.sh
echo "" >> ${PKG}.sh
echo "mkdir ${PKG}" >> ${PKG}.sh
echo "cd ${PKG}" >> ${PKG}.sh
echo "apt-get download \\" >> ${PKG}.sh

for i in $(apt-rdepends ${PKG} | grep --invert-match "Depends")
do
    echo "    ${i} \\" >> ${PKG}.sh
done

truncate -s-2 ${PKG}.sh

echo "" >> ${PKG}.sh
