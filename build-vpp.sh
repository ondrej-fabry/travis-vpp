#!/bin/sh
set -e

VPP_COMMIT="4c9f2a805038a2d4f663b05a3d08ac4ee1eec3da"

# clone vpp
git clone https://gerrit.fd.io/r/vpp
cd vpp
git checkout ${VPP_COMMIT}

# apply patches
patch -p1 <../vpp.patch

# build vpp
yes | make install-dep
make bootstrap
make pkg-deb

cd build-root
tar -cvf /root/vpp.tar vpp_*.deb vpp-dev_*.deb vpp-lib_*.deb vpp-plugins_*.deb
