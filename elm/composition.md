# Composition reminders

## Compose / Pipe functions ( <<, >>, |>, <|)

``` elm
> appendPrefix name = "Miss" ++ name
<function> : String -> String
> greeting name = "How are you today, " ++ name
<function> : String -> String
> (appendPrefix " Alice. ") ++ (greeting "Alice" ++ "?")
"Miss Alice. How are you today, Alice?" : String
> (greeting << appendPrefix) " Alice?"
"How are you today, Miss Alice?" : String
> (greeting >> appendPrefix) " Alice?"
"MissHow are you today,  Alice?" : String
> (appendPrefix >> greeting) " Alice"
"How are you today, Miss Alice" : String
> " alice" |> appendPrefix |> greeting
"How are you today, Miss alice" : String
> greeting <| appendPrefix <| " alice"
"How are you today, Miss alice" : String
```
