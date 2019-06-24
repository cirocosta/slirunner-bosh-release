# slirunner-bosh-release

> A [BOSH](https://bosh.io/docs/) release that wraps [`slirunner`](https://github.com/cirocosta/slirunner).


## Usage

A sample deployment manifest can be found under [`./deployment/manifest.yml`](./deployment/manifest.yml).


## Building

To tweak this BOSH release:

1. retrieve `slirunner.tgz`, either from:
  - from a GitHub release (see [`slirunner` releases](https://github.com/cirocosta/slirunner/releases)), or
  - locally built (`tar czvf slirunner.tgz $fly_binary $slirunner_binary`)

2. put the compresed tarball under `src`
  - ps.: `make get-slirunner` will fetch it from GitHub releases and do this for you

3. create the release
  - `make final-release` or
  - `make release`


## License

See [./LICENSE](./LICENSE).

