# Compiler

Tips&Tricks for profiling and compiling
Mostly from [Jose Valim](https://dashbit.co/blog/how-to-debug-elixir-erlang-compiler-performance) ofc

## Isolating slow files

``` bash
# 
mix compile --force --profile time
```

will produce

``` bash
[profile] FILE compiled in COMPILE_TIME (plus WAITING_TIME waiting)
```

 * COMPILE_TIME is the time we were effectively compiling code. However, since a file may depend on a module defined in another file,
 *WAITING_TIME is the time we wait until the file we depend on becomes available.

High waiting times are not usually a concern, so we focus on the files with high compilation times.

## Timing slow file

``` bash
mix compile
touch lib/problematic_file.ex
ERL_COMPILER_OPTIONS=time mix compile
# ERL_COMPILER_OPTIONS=time mix run lib/problematic_file.ex
```

## Moving to Erlang

``` bash
mix archive.install github michalmuskala/decompile
mix decompile ProblematicModule --to erl

# Compile in Erlang
erlc +time Elixir.ProblematicModule.erl

# Profile `core` file
erlc +'{eprof, core}' Elixir.ProblematicModule.erl
```

