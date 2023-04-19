#!/bin/bash

PKG=${1}

for p in $(ls ${PKG})
do
    sudo dpkg -i ${p}
done

sudo apt-get --fix-broken install
