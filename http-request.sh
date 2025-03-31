#!/usr/bin/env bash
#
# http-request.sh
#

# Safety flags
set -euo pipefail

# Ensure /dev/tcp is supported
if [[ ! -e /dev/tcp ]]; then
  echo "Error: Your system does not support /dev/tcp. Please ensure your shell has this feature enabled." >&2
  exit 1
fi

# Define target host and port
host="icanhazip.com"
port=80

# Open file descriptor for the TCP connection
exec 3<>/dev/tcp/"$host"/"$port" || {
  echo "Error: Failed to connect to $host on port $port." >&2
  exit 1
}

# HTTP request lines
request_lines=(
  "GET / HTTP/1.1"
  "Host: $host"
  "Connection: close"
  ""
)

# Send HTTP request
printf '%s\r\n' "${request_lines[@]}" >&3

# Read response data
echo "Reading response from $host:"
while IFS= read -r data <&3; do
  echo "Received: $data"
done

# Close the file descriptor
exec 3>&-

echo "HTTP request completed successfully."
