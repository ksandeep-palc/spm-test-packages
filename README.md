# spm-test-packages

Tiny container images for testing the SONiC Package Manager (spm) against a real registry:
`package install from-repository`, `show package versions`, `package upgrade`, and digest pins.

| Image | Purpose |
|---|---|
| `ghcr.io/ksandeep-palc/spm-test-pkg:1.0.0` | install target |
| `ghcr.io/ksandeep-palc/spm-test-pkg:1.1.0` (`latest`) | upgrade target; second tag for `show package versions` |

Each image is `busybox` plus the `com.azure.sonic.manifest` label spm reads. Package and service
name: `spmregpkg` (the image name stays `spm-test-pkg`; the suite's DUT-built tarball package is
`spmtestpkg`, so the two never collide). It installs as a host service and does nothing when started.

## Publish
Push to `main` (or run the workflow by hand). GitHub Actions builds linux/amd64 and linux/arm64
and pushes to GHCR with the repo's `GITHUB_TOKEN`; no personal token is needed.

**One-time:** new GHCR packages are private. After the first run, open
Package settings → Change visibility → **Public**, so the DUT can pull anonymously.

## Local build
`./build.sh` builds `spm-test-pkg:1.0.0/1.1.0` into the local docker.
