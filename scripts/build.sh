#!/bin/sh

if [ ! -f "VERSION" ]; then
  echo "No VERSION file found, exiting"
  exit 1
fi

VERSION=$(cat "VERSION")

echo "# Updating version $VERSION"
./scripts/set_version.sh
[ $? -eq 1 ] && exit 1

echo "# Running initial V1 build"
make -C buildroot V=1

echo "# Updating bmc configurations"
./scripts/bmc_configs.sh
[ $? -eq 1 ] && exit 1

echo "# Rebuilding with bmc changes"

make -C buildroot linux-rebuild
make -C buildroot swupdate-rebuild
make -C buildroot V=1

./scripts/mkfw.sh

echo "# Finished Build $VERSION"
