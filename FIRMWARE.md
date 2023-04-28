# Firmware
> Overview of the firmware

# NAND Flash MX35LF1GE4AB (/dev/ubi0)
> 1Gb(125MB) in size, split into two primary volumes

## MTD Information
```console
mtd3
Name:                           sys
Type:                           nand
Eraseblock size:                262144 bytes, 256.0 KiB
Amount of eraseblocks:          492 (128974848 bytes, 123.0 MiB)
Minimum input/output unit size: 4096 bytes
Sub-page size:                  2048 bytes
OOB size:                       128 bytes
Character device major/minor:   90:6
Bad blocks are allowed:         true
Device is writable:             true
```

## /dev/ubi0_5 (rootfs)
> Root filesystem mounted as / using /dev/mtd3 (sys)

```console
-----------------------------------
Volume ID:   5 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        163 LEBs (42061824 bytes, 40.1 MiB)
State:       OK
Name:        rootfs
Character device major/minor: 244:6
-----------------------------------
```

## /dev/ubi0_6 (recovery)
> Recovery filesystem which is unmounted
```console
-----------------------------------
Volume ID:   6 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        163 LEBs (42061824 bytes, 40.1 MiB)
State:       OK
Name:        recovery
Character device major/minor: 244:7
-----------------------------------
```