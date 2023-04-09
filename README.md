# piuparts docker action

This action runs [`piuparts`](https://salsa.debian.org/debian/piuparts) on a Debian package.

## Inputs

### `package`

The package to run `piuparts` on. Default `"*.changes"`.

### `base-image`

The base image to run `piuparts` in. Default `"debian:sid"`.

### `fake-essential-packages`

Packages that should be added to the fake-essential-packages list. Default `""`.

## Example usage

```yaml
uses: evgeni/action-piuparts@devel
with:
  package: path/to/the/package_1.0.0-1_all.changes
```
