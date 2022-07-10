[![tests](https://github.com/mjx-project/mjx-convert/actions/workflows/tests.yml/badge.svg)](https://github.com/mjx-project/mjx-convert/actions/workflows/tests.yml)

# mjx-convert

Convert Mahjong log into another format.

## Install

```sh
$ make install
```

## Example

### Using stdin

```sh
$ cat test.mjlog | mjxc convert --to-mjxproto
$ cat test.mjlog | mjxc convert --to-mjxproto-raw
$ cat test.json  | mjxc convert --to-mjlog
```

### Using file inputs

```sh
$ mjxc convert ./mjlog_dir ./mjxproto_dir --to-mjxproto
$ mjxc convert ./mjlog_dir ./mjxproto_dir --to-mjxproto-raw
$ mjxc convert ./mjxproto_dir ./mjlog_dir --to-mjlog
```

## Note

- File inputs assume that each file corresponds to each game in any format.
- Difference between mjxproto and mjxproto-raw:
  1. Yaku is sorted in yaku number
  2. Yakuman's fu is set to 0
