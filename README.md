# rind-patch

Crates under the names of crates.io crates, re-exporting
[rind](https://github.com/moq-dev/rind)'s adapters, so that a binary's
`[patch.crates-io]` moves its whole dependency tree onto rind.
None is published, since crates.io has each name.

## ring

[`ring/`](ring) re-exports [rind-ring](https://crates.io/crates/rind-ring)
under ring's name and accepts every ring 0.17 feature. A binary patches
ring in its workspace's root `Cargo.toml`, then runs `cargo update -p ring`:

```toml
[patch.crates-io]
ring = { git = "https://github.com/moq-dev/rind-patch" }
```

Every crate in the tree on ring 0.17 then builds rind-ring, including
rustls and quinn-proto on their `ring` features. The shim's version,
0.17.999, meets every ring 0.17 requirement. Where the patch is not used,
such as for an exact requirement like `=0.17.14` or before the lockfile is
updated, Cargo builds crates.io's ring and only warns, so check that
`cargo tree -i ring` prints `ring v0.17.999` from this repository alone.

rind-ring's [README](https://github.com/moq-dev/rind/blob/main/rind-ring/README.md)
lists what it leaves out and what behaves differently from ring.

rind's own CI builds and runs a fixture through this patch, with rind-ring
from rind's checkout, so a rind-ring change is tested here before its release.

## License

Apache-2.0 OR ISC OR MIT-0, at your option, as rind is:
[LICENSE-APACHE](LICENSE-APACHE), [LICENSE-ISC](LICENSE-ISC),
[LICENSE-MIT-0](LICENSE-MIT-0).
