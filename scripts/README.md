# 🤖 Scripts for Turing Pi 2 Firmware
> Documentation for the build process and scripts.

### Notes:

- ⚠️ All commands are run from the root directory
- Scripts are exposed in ./tpi.sh <command>

# ℹ️ Details
> Full explanation of the zpi.sh

## 🎉 ./zpi.sh init
Update the ./buildroot/.config, this will override the existing configuration.

```bash
make -C buildroot BR2_EXTERNAL="../br2t113pro" 100ask_t113-pro_spinand_core_defconfig
```

## 🔨 ./zpi.sh build <VERSION> (build.sh)

Build is split into four parts:
 - [Initial Build](#-initial-build): Gathers assets
 - [Apply Configuration](#-apply-configuration): Applies the custom firmware to the ./buildroot/output
 - [Rebuild](#-rebuild): Builds new configurations
 - [Make Firmware](#-make-firmware): Creates firmware distributions


#### 🎉 Initial Build

Run an initial build

```bash
make -C buildroot V=1
```

#### ⚙️ Apply Configuration (bmc_configs.sh)

Copy configruation files over, only needs to be run once (*unless the `./buildroot/output` is deleted*). 
It must have a valid `V=1` [Initial Build](#-initial-build) to create the buildroot output.  

Files to copy
```bash
cd ../
cp bmc4tpi/config/sun8iw20p1* buildroot/output/build/linux-5112fdd843715f1615703ca5ce2a06c1abe5f9ee/arch/arm/boot/dts/
cp bmc4tpi/config/kernelconfig buildroot/output/build/linux-5112fdd843715f1615703ca5ce2a06c1abe5f9ee/.config
cp bmc4tpi/config/swupdateconfig buildroot/output/build/swupdate-2021.11/.config
cp bmc4tpi/swupdate/sw-description buildroot/output/images/
cp bmc4tpi/swupdate/genSWU.sh buildroot/output/images/
cp bmc4tpi/swupdate/env0.fex buildroot/output/images/
cp bmc4tpi/swupdate/env1.fex buildroot/output/images/
```

#### 🔨 Rebuild

Rebuild needs to compile the **linux**, **swupdate** and finally the **V=1** project. Must have a [valid
configuration](#-apply-configuration).

linux rebuild:
```bash
make -C buildroot linux-rebuild
```
swupdate rebuild:
```bash
make -C buildroot swupdate-rebuild
```
v=1 rebuild:
```bash
make -C buildroot V=1
```

### 📦 Make Firmware (mkfw.sh)

Firmware pulls from the VERSION file and copies the assets to the `./build` directory. Must have a [valid
configuration](#-apply-configuration), or it will fail to build the firmware!

```bash
./scripts/mkfw.sh
```
