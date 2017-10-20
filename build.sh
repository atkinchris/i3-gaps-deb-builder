#!/bin/bash

set -eu

# Checkout the source
git clone https://www.github.com/Airblader/i3
cd i3
TAG=$(git describe --tags)
git checkout $TAG

# Fix rules
cat <<EOF >>debian/rules
override_dh_install:
override_dh_installdocs:
override_dh_installman:
	dh_install -O--parallel
EOF

# Build package
dpkg-buildpackage -us -uc

# Copy package to output
cp ../*.deb /output
