# Beam

Info and utilities to work with the beam in less standard ways

## Optimization

From [@jlouis666](https://medium.com/@jlouis666/erlang-string-handling-7588daad8f05)

> When programming Erlang, the compiler and VM will automatically generate binaries and sub-binaries for you. Write your code in a straightforward and readable manner first. Then compile your program with
> `+bin_opt_info`
> to have the compiler report on which binaries were not optimised in code which is heavily traversed by the program.



## Opening ports <1000

From [here](https://pedroassuncao.com/posts/allow-erlangelixir-to-open-ports-80-and-443)

> By default users other than root cannot open ports below 1000, for security reasons. If you want to - say - run your website in Elixir without nginx on port 80 or 443, you can allow the Erlang binary to open ports below 1000 using setcap (run as root):

```
setcap 'cap_net_bind_service=+ep' <path_to_erlang_folders>/erts-11.1/bin/beam.smp
```

for asdf users

```
asdf which erl
# /home/zoten/.asdf/installs/erlang/24.1.6/bin/erl
# the beam.smp file is located in the erts-*/bin folder
# I'll try to come up with a decent shell helper sooner or later
```
