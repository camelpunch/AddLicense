# AddLicense

Xcode doesn't do licenses well, so this.

## Installation

Grab the binary from the [latest release](https://github.com/camelpunch/AddLicense/releases).

## Usage

To apply `my-license.txt` with '//' comments to all `*.m` and `*.h` files in
`dir1` `dir2` and `dir3`:

```
add-license m,h '//' my-license.txt dir1 dir2 dir3
```

## Build

Because I'm a noob and don't know any better:
```
xcrun -sdk macosx swiftc AddLicense/OptionParser.swift AddLicense/LicenseRewriter.swift AddLicense/main.swift -o add-license
```
