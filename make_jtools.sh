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

# Copy new stuff
tar --disable-copyfile -cvf jtoolspack.tar .
cd ..

# Move to new location
mv staging/jtoolspack.tar tars/jtoolspack.tar
rm -rf staging
