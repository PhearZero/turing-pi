# 🕺 ZeroPi 2
```
__________                 __________.__  ________
\____    /___________  ____\______   \__| \_____  \
  /     // __ \_  __ \/  _ \|     ___/  |  /  ____/
 /     /\  ___/|  | \(  <_> )    |   |  | /       \
/_______ \___  >__|   \____/|____|   |__| \_______ \
        \/   \/                                   \/
Custom Firmware for the Turing Pi 2, there be dragons
```

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

Please see [Dhanos Community Edition](https://github.com/daniel-kukiela/turing-pi-2-community-edition-firmware) or the
[Official Turing Pi 2](https://github.com/wenyi0421/turing-pi) firmware stable use. This is an experimental firmware
for personal use. This is an **UNOFFICIAL** build of the Turing Pi 2 firmware. It is **NOT** generally safe to use
this firmware, do not use this software! Neither TURING MACHINES INC. nor me are not responsible for any possible damage
made by this firmware. You have been warned!

Please consider [buying @daniel-kukiela a coffee](https://ko-fi.com/dhanos)!!!!

This borrows from [@daniel-kukiela](https://github.com/daniel-kukiela) work in the [Unofficial Community Version](https://github.com/daniel-kukiela/turing-pi-2-community-edition-firmware)
while preserving any changes in the [Official Turing Pi 2](https://github.com/wenyi0421/turing-pi) firmware.

# 📦 Compiling

## ⚙️ Install the necessary dependent packages
```bash
sudo apt-get install build-essential subversion git-core libncurses5-dev zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl mercurial bzr ecj cvs unzip lib32z1 lib32z1-dev lib32stdc++6 libstdc++6 libncurses-dev u-boot-tools mkbootimg bc -y
```

## ⚙️ Getting Started
```bash
# Clone the project and change directory
git clone git@github.com:PhearZero/zero-pi-2.git
cd zero-pi-2

# Configure buildroot for your system
./zpi.sh init

# Make sure Python3 is not installed in the buildroot menu. The path is:
# Target Packages > Interpreter languages and scripting > python3
# Opening the menu by running:
./zpi.sh menu

# Finally run a full build for the system, this only has to be done once
# Can optionally pass in a VERSION, by default it is stored in the VERSION file
./zpi.sh build # Make sure the final image has a valid MBR, it will be near the end of the output
```

## ⚙️ Update Existing Build
```bash
# Once the project is built, it will have already run mkfw once.
# After changes are made, the project can be rebuilt much faster using
./zpi.sh mkfw
```

## Windows Tips:
- Install [Ubuntu WSL](https://ubuntu.com/wsl) from the app store
- Remove the windows path from WSL to use built in toolchains and remove spaces from path
- Clone the repository after removing windows path to ensure line file endings are LF

Example `/etc/wsl.conf` for the Ubuntu WSL instance:
```
[interop]
appendWindowsPath = false
```
