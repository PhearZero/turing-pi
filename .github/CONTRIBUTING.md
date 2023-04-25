# 👥 Contributing
> Guide on how to extend the zero-pi-2 firmware

## ℹ️ Overview

 - Project uses github-flow, start by forking the project
 - `main` is a stable branch with the latest changes
 - Once an issue is created and assigned to a developer, a feature branch is created
 - Work is performed in the feature branch then submitted as a Pull Request

## 🔀 Flow Operations:

1. Fork repository including all branches
2. Creating a [new issue](https://github.com/PhearZero/zero-pi-2/issues/new)
3. Submit PR with completed work to the original Feature Branch associated with the Issue

## ⚙️ Building

See the [README](../README.md) for basic details. More advanced documentation is available
in [./scripts](../scripts/README.md).

## 📂 Structure

```
.
├── VERSION            # Application Version
├── app
│   ├── bmc            # Baseboard Management Controller(BMC)
│   ├── helloworld     # Example Project
│   └── tpi            # Turing Pi Interface
|
├── bmc4tpi            # The buildroot assets for the BMC
├── br2t113pro         # The buildroot assets for the Allwinner board
├── buildroot          # Buildroot installation
|
├── build              # Image and binary output location
├── scripts            # Bash scripts for building the project
└── zpi.sh             # Tool for managing the build
```
