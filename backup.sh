#!/usr/bin/env bash
#
# backup.sh
#

# Set 'set -euo pipefail' for safety: 
# - 'e': Exit on command failure
# - 'u': Treat unset variables as errors
# - 'o pipefail': Fail pipeline if any command fails
set -euo pipefail

# Check command availability
required_commands=("tar" "date" "hostname" "ls")
for cmd in "${required_commands[@]}"; do
  if ! command -v "$cmd" > /dev/null; then
    echo "Error: Required command '$cmd' is not available. Please install it and try again." >&2
    exit 1
  fi
done

# Files to backup
backup_files="/home/$USER/"

# Destination directory for the backup
dest="/home/$USER"

# Create archive filename
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tar.gz"

# Validate backup_files directory
if [[ ! -d "$backup_files" ]]; then
  echo "Error: Directory '$backup_files' does not exist. Please check the path." >&2
  exit 1
fi

# Validate destination directory
if [[ ! -d "$dest" ]]; then
  echo "Error: Destination directory '$dest' does not exist. Please check the path." >&2
  exit 1
fi

# Print start status message
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar
tar czf "$dest/$archive_file" "$backup_files"

# Print end status message
echo
echo "Backup finished"
date

# List files in $dest to check file sizes
ls -lh "$dest"
