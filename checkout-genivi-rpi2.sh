## This script will setup the layers for building the genevi baseline 9.0
## for the raspberry pi 2

echo "Checkout Poky (Fido branch:eb4a134a60e3ac26a48379675ad6346a44010339)"
git clone git://git.yoctoproject.org/poky
cd poky; git checkout eb4a134a60e3ac26a48379675ad6346a44010339; cd -

echo "Checkout Open Embedded (fido branch:5b0305d9efa4b5692cd942586fb7aa92dba42d59)"
git clone git://git.openembedded.org/meta-openembedded
cd meta-openembedded; git checkout 5b0305d9efa4b5692cd942586fb7aa92dba42d59; cd -

echo "Checkout Genivi Baseline (master branch:ad092e5a287455f2815b3e3f047ca3d1b4bb889b)"
git clone git://git.yoctoproject.org/meta-ivi
cd meta-ivi; git checkout ad092e5a287455f2815b3e3f047ca3d1b4bb889b; cd -

echo "Checkout meta-raspberrypi from Samsung Tizen repository (3d_accel_vc4 branch)"
git clone git://git.s-osg.org/meta-raspberrypi.git -b 3d_accel_vc4
cd meta-raspberrypi; git checkout f5e385a83d6cdffc68a0b2ff87f08d2d89f473a0; cd -

echo "Patching meta-ivi-bsp..."
cd meta-ivi
patch  -p 1  < ../meta-ivi-bsp-for-raspberrypi2.patch
cd -

echo "Patching meta-raspberrypi..."
cd meta-raspberrypi
patch  -p 1  < ../meta-raspberrypi-no-tizen-dependencies.patch
cd -
