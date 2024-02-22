# Usage tips

Generate keys

``` bash
# full interactive
gpg --full-generate-key

# wil not generate a key for encryption
gpg --default-new-key-algo rsa4096 --gen-key
```

## List Keys

``` bash
gpg --list-keys --keyid-format=long
gpg --list-secret-keys --keyid-format=long
```

## Edit keys

If you generated a key with insufficient permissions you can regenerate it

``` bash
gpg --edit-key <ID>

# in the prompt you can
> change-usage
# to add, delete or remove capabilities. The key will change
```

## Export keys

``` bash
# --armor for printable characters
gpg --output staging.public.pgp --armor --export <ID>
gpg --output staging.private.pgp --armor --export-secret-keys <ID>
```

