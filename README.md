# N64-template

This is a template for how to set up and build N64 games using the official SDK
and [wine](https://www.winehq.org/).

## Prereqs

1. Install [wine](https://www.winehq.org).
2. Install the official N64 SDK. Instructions can be found
  [here](https://www.retroreversing.com/n64-sdk-setup).

## How to build (macOS or linux):

```
make build
```

To run on RetroArch on a Mac, run:
```
make
```

_or_

```
make run_on_emulator
```

To run using Everdrive and [loader64](https://github.com/jsdf/loader64).
```
make run_on_device
```


