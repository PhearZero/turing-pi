#!/bin/sh

version=$(cat VERSION)

BANNER=$(
  cat <<-EndOfMessage
__________                 __________.__  ________
\____    /___________  ____\______   \__| \_____  \\
  /     // __ \_  __ \/  _ \|     ___/  |  /  ____/
 /     /\  ___/|  | \(  <_> )    |   |  | /       \\
/_______ \___  >__|   \____/|____|   |__| \_______ \\
        \/   \/                                   \/
Custom Firmware for the Turing Pi 2, there be dragons
OS: $(uname -a)
Version: $version\n
EndOfMessage
)

USAGE=$(
  cat <<-EndOfMessage
Usage:
  ./zpi.sh init            # Update the base buildroot configuration for your system, it will override any .config files
  ./zpi.sh build <VERSION> # Full build, including linux. Version is optional and will be pulled from VERSION file
  ./zpi.sh menu            # Run buildroot menuconfig
  ./zpi.sh mkfw <VERSION>  # Lightweight rebuild of V=1. Version is optional, updates version before rebuild firmware
EndOfMessage
)

error() {
  echo "$USAGE\n"
  echo "Error:"
  echo "  $1\n"
  exit $2
}

echo "$BANNER"

if [ $# -eq 0 ]; then
  error "Missing command" 1
fi

case $1 in
"build")
  if [ ! -z "$2" ]; then
    echo "$2" >VERSION
  fi
  ./scripts/build.sh
  ;;
"menu")
  cd ./buildroot
  make menuconfig
  cd ../
  ;;
"init")
  echo "# Configuring br2t113pro\n"
  cd ./buildroot
  make BR2_EXTERNAL="../br2t113pro" 100ask_t113-pro_spinand_core_defconfig
  cd ../
  ;;
"mkfw")
  if [ ! -z "$2" ]; then
    echo "$2" >"VERSION"
    ./scripts/set_version.sh
  fi
  ./scripts/mkfw.sh
  ;;
*)
  # The wrong first argument.
  error "Invalid argument", 1
  ;;
esac
echo "Finished"
