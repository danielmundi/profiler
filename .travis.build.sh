#!/bin/bash

set -e

echo "Create chroot"
sudo sbuild-createchroot --arch=${DEB_ARCH} ${DEB_DISTRO} \
    /srv/chroot/${DEB_DISTRO}-${DEB_ARCH}-sbuild http://deb.debian.org/debian

echo "Build dsc"
res=$(dpkg-source -b ./)

dsc_file=$(echo "$res" | grep .dsc | grep -o '[^ ]*$')

echo "Build package"
sudo sbuild --arch=${DEB_ARCH} -c ${DEB_DISTRO}-${DEB_ARCH}-sbuild \
    -d ${DEB_DISTRO} ../${dsc_file}

export DEB_NAME=$(find ../ -name "*.deb")