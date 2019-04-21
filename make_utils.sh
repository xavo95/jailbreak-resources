#!/usr/bin/env bash

rm -rf staging
mkdir staging
cp -v utils_ent/* staging/
cd staging

curl http://newosxbook.com/tools/binbag --output binbag.arm64
curl http://newosxbook.com/tools/binbag.arm64e --output binbag.arm64e

curl http://newosxbook.com/tools/bash.arm64 --output bash.arm64
curl http://newosxbook.com/tools/bash.arm64e --output bash.arm64e

curl http://NewOSXBook.com/tools/jtool2.tgz --output jtool2.tgz
tar -zxvf jtool2.tgz jtool2
rm -rf jtool2.tgz

curl -L https://github.com/sbingner/ldid/releases/download/v2.0.1/ldid.gz --output ldid.gz
gzip -d ldid.gz
chmod 755 ldid

# Snappy(@Sbingner) and nonceutil(@pwd20wndstuff) will come soon, but first I have to clean something

ldid2 -Sbinbag.ent binbag.arm64
ldid2 -Sbinbag.ent binbag.arm64e
ldid2 -Sdefault.ent bash.arm64
ldid2 -Sdefault.ent bash.arm64e

ldid2 -Sdefault.ent jtool2

# Sign himself
ldid2 -Sdefault.ent ldid
rm -rf *.ent

# Copy new stuff
tar --disable-copyfile -cvf utilspack.tar .
cd ..

# Move to new location
mv staging/utilspack.tar tars/utilspack.tar
rm -rf staging
