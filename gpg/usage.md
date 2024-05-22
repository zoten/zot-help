# Usage tips

Generate keys

``` bash
# full interactive
gpg --full-generate-key

# will not generate a key for encryption
gpg --default-new-key-algo rsa4096 --gen-key
```

Non-interactive

[original gist](https://gist.github.com/woods/8970150?permalink_comment_id=3500397#gistcomment-3500397)

``` bash
gpg --batch --gen-key <<EOF
Key-Type: 1
Key-Length: 2048
Subkey-Type: 1
Subkey-Length: 2048
Name-Real: Root Superuser
Name-Email: root@handbook.westarete.com
Expire-Date: 0
EOF
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

## Sign

``` bash
# sign with specific user id
gpg --output doc.sig -u <ID> --sign doc

# verify
gpg --output doc -u <ID> --verify doc.sig

# verify and extract with specific user id
gpg --output doc -u <ID> --decrypt doc.sig
```

## Delete key

``` bash
gpg --delete-secret-key <ID>
```
