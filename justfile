#!/usr/bin/env just --justfile

# Using Just: https://github.com/casey/just?tab=readme-ov-file#installation

# List all of the available commands.
default:
	just --list

# Run what CI runs: formatting, then lints of every shim against the rind adapter published on crates.io.
ci:
	cargo fmt --all --check
	cargo clippy --workspace --all-features -- --deny warnings
