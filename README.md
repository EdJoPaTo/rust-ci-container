# Container Image for running Rust CI tasks

Uses the oldest supported Debian release as base image to support more glibc versions.

Tools like cargo-deb or nightly rustfmt are preinstalled so they are simply reused on CI runs.
