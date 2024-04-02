# Rust Compiler tips & tricks

## Dev optimization

Set the opt-level for development higher in order to possibly reduce dev compile times and improve performance.
Rust compiler sets an opt-level of 0 for development builds. We're going to give it an opt-level of 1 for our code,
and an opt-level of 3 for all the dependencies of our code.

``` toml
[profile.dev]
opt-level = 1
[profile.dev.package."*"]
opt-level = 3
```
## Mold as linker

[mold](https://github.com/rui314/mold)

``` bash
mold -run cargo build
```

or in `.cargo/config.toml`

``` toml
[target.x86_64-unknown-linux-gnu]
linker = "clang"
rustflags = ["-C", "link-arg=-fuse-ld=/path/to/mold"]
```

## Cranelift isntead of LLVM

``` bash
rustup update nightly #install nightly if you haven't already
rustup component add rustc-codegen-cranelift-preview --toolchain nightly
```

``` toml
[unstable]
codegen-backend = true
[profile.server-dev]
codegen-backend = "cranelift"
```

## Sources

 * https://benw.is/posts/how-i-improved-my-rust-compile-times-by-seventy-five-percent
