#!/usr/bin/env bash

# Open file descritor
exec 3<>/dev/tcp/icanhazip.com/80

lines=(
    'GET / HTTP/1.1'
    'Host: icanhazip.com'
    'Connection: close'
    ''
)

printf '%s\r\n' "${lines[@]}" >&3

# Read as long as there is data
while read -r data <&3; do
    echo "Got data: $data"
done

# Close the file descriptor
exec 3>&-

