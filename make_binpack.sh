#!/usr/bin/env bash

rm -rf staging
mkdir staging
cp old/iosbinpack_jake.tar staging/
cd staging
tar -xvf iosbinpack_jake.tar

rm -rf iosbinpack64/amfid_payload.dylib_
rm -rf iosbinpack64/dropbear.plist
#rm -rf iosbinpack64/makeMeAtHome.sh
rm -rf iosbinpack64/pspawn.dylib
rm -rf iosbinpack64/test
rm -rf iosbinpack64/bin/jailbreakd_client
rm -rf iosbinpack64/bin/amfidebilitate
rm -rf iosbinpack64/LaunchDaemons/jailbreakd.plist
rm -rf iosbinpack64/LaunchDaemons/testbin.plist

rm -rf iosbinpack64/usr/local/bin/jtool
rm -rf iosbinpack64/usr/local/bin/qilin.o
rm -rf iosbinpack64/usr/local/bin/shaihulud
rm -rf iosbinpack64/usr/local/bin/shaihulud.c

# Copy new stuff
tar --disable-copyfile -cvf iosbinpack.tar iosbinpack64
cd ..

# Move to new location
mv staging/iosbinpack.tar tars/iosbinpack.tar
rm -rf staging
