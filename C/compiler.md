# C/C++ Compiler Tricks

## List default include directories

```
# Thanks to https://stackoverflow.com/questions/4980819/what-are-the-gcc-default-include-direc

# C

gcc -xc -E -v -

# C++
gcc -xc++ -E -v -
```
## Temporarily disable compiler warnings as errors

```
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-prototypes"
#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#pragma GCC diagnostic ignored "-Wunused-function"
```
