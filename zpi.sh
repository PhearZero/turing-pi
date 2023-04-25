#!/bin/sh

version=$(cat VERSION)

BANNER=$(
  cat <<-EndOfMessage
__________                 __________.__  ________
\____    / ___________  ____\______   \__| \_____  \\
  /     / / __ \_  __ \/  _ \|     ___/  |  /  ____/
 /     / \  ___/|  | \(  <_> )    |   |  | /       \\
/_______  \___  >__|   \____/|____|   |__| \_______ \\
        \/    \/                                   \/
EndOfMessage
)

HEADING=$(
cat <<-EndOfMessage
Custom Firmware for the Turing Pi 2, there be dragons
OS: $(uname -a)
Version: $version
EndOfMessage
)



USAGE=$(
  cat <<-EndOfMessage
Usage:
  ./zpi.sh init            # Update the base buildroot configuration for your system, it will override any .config files
  ./zpi.sh build <VERSION> # Full build, including linux. Version is optional and will be pulled from VERSION file
  ./zpi.sh menu            # Run buildroot menuconfig
  ./zpi.sh mkfw <VERSION>  # Lightweight rebuild of V=1. Version is optional, updates version before rebuild firmware
  ./zpi.sh help            # Show this usage menu
EndOfMessage
)

error() {
  printf "%s\n\n" "$USAGE"
  tput setaf 1; printf "Error:\n"; tput sgr0
  tput setaf 1; printf "  %s\n" "$1"; tput sgr0
  exit "$2"
}

tput setaf 1; printf "%s\n" "$BANNER"; tput sgr0
tput setaf 2; printf "%s\n\n" "$HEADING"; tput sgr0

if [ $# -eq 0 ]; then
  error "Missing command" 1
fi

case $1 in
"init")
  echo "# Configuring br2t113pro"
  make -C buildroot BR2_EXTERNAL="../br2t113pro" 100ask_t113-pro_spinand_core_defconfig
  ;;
"build")
  if [ -n "$2" ]; then
    echo "$2" >VERSION
  fi
  ./scripts/build.sh
  ;;
"mkfw")
  if [ -n "$2" ]; then
    echo "$2" >VERSION
    ./scripts/set_version.sh
  fi
  ./scripts/mkfw.sh
  ;;
"menu")
  make -C buildroot menuconfig
  ;;
"help")
   printf "%s\n" "$USAGE"
  ;;
*)
  error "Invalid argument", 1
  ;;
esac
