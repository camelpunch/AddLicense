# AddLicense

Xcode doesn't do licenses well, so this.

## Build

Because I'm a noob and don't know any better:
```
xcrun -sdk macosx swiftc AddLicense/LicenseRewriter.swift AddLicense/main.swift -o add-license
```

## Usage

```
add-license my-license.txt dir1 dir2 dir3
```
