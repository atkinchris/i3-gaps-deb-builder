#!/bin/bash

set -eu

# Checkout the source
git clone https://www.github.com/Airblader/i3
cd i3
TAG=$(git describe --tags)
git checkout $TAG

# Build the project
echo "Building $TAG"
autoreconf --force --install
rm -rf build
mkdir -p build && cd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
mkdir -p /tmp/contents
make DESTDIR=/tmp/contents install

# Build the package
fpm -s dir -t deb \
  -C /tmp/contents \
  --name i3-gaps \
  --version $TAG \
  --iteration 1 \
  --description "i3-gaps – i3 with more features" \
  .

cp *.deb /output
