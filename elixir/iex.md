# iex

tweaks for working with interactive elixir shell

## .iex.exs

You can create a `.iex.exs` file to autoload some configuration/command, e.g.

``` elixir
IEx.configure(
  inspect: [limit: :infinity],
  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :light_green,
      boolean: [:light_blue],
      nil: [:magenta, :bright]
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline]
  ],
  default_prompt:[
    # ANSI CHA, move cursor to column 1
    "\e[G",
    :light_magenta,
    # plain string
    "iex ➜", :white, :reset
  ]
  |> IO.ANSI.format()|> IO.chardata_to_string()
)
```

## Exit broken command

If you are stuck in a broken expression in iex you can type:

```
#iex:break
```
