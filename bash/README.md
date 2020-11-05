# Bash

## Other Useful Orocedures

### Read file line-by-line

[StackOveflow](https://stackoverflow.com/a/10929511/4478420)

```sh
while IFS= read -r line; do
    echo "Text read from file: $line"
done < my_filename.txt
```

### Monitor http traffic including headers and request bodies

```sh
IFACE=eth0, PORT=80; tcpdump -A -i ${IFACE} -s 0 "tcp port ${PORT} and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)"
```
