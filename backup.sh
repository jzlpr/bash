#!/usr/bin/env bash
#
# backup.sh
#

# Files to backup
backup_files="/home/$USER/sources/repos"

dest="/home/$USER"

# Create archive filename.
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo
    
# Backup the files using tar.
tar czf $dest/$archive_file $backup_files
    
# Print end status message.
echo
echo "Backup finished"
date
    
# Long listing of files in $dest to check file sizes.
ls -lh $dest
