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

## Building from Xcode

- Product > Archive > Export

The resulting folder contains an executable called `add-license`.
