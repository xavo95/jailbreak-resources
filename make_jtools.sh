#!/usr/bin/env bash

rm -rf staging
mkdir staging
cd staging

curl http://newosxbook.com/tools/binbag --output binbag.arm64
curl http://newosxbook.com/tools/binbag.arm64e --output binbag.arm64e

curl http://newosxbook.com/tools/bash.arm64 --output bash.arm64
curl http://newosxbook.com/tools/bash.arm64e --output bash.arm64e

curl http://NewOSXBook.com/tools/jtool2.tgz --output jtool2.tgz
tar -zxvf jtool2.tgz jtool2
rm -rf jtool2.tgz

# Procexp and more comming soon
ldid2 -S../jtools_ent/binbag.ent binbag.arm64
ldid2 -S../jtools_ent/binbag.ent binbag.arm64e
ldid2 -S../jtools_ent/default.ent bash.arm64
ldid2 -S../jtools_ent/default.ent bash.arm64e

ARCH=arm64 ldid2 -S../jtools_ent/default.ent jtool2
ARCH=arm64e ldid2 -S../jtools_ent/default.ent jtool2

# Copy new stuff
tar --disable-copyfile -cvf jtoolspack.tar .
cd ..

# Move to new location
mv staging/jtoolspack.tar tars/jtoolspack.tar
rm -rf staging
