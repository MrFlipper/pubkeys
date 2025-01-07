#!/bin/bash

# Define the paths
AUTHORIZED_KEYS="$HOME/.ssh/authorized_keys"
BACKUP_AUTHORIZED_KEYS="$HOME/.ssh/authorized_keys_backup"

# Step 1: Move the current authorized_keys to the backup location
if [[ -f "$AUTHORIZED_KEYS" ]]; then
    echo "Backing up existing authorized_keys to authorized_keys_backup..."
    mv "$AUTHORIZED_KEYS" "$BACKUP_AUTHORIZED_KEYS"
else
    echo "No existing authorized_keys file found, proceeding..."
fi

# Step 2: Create a new empty authorized_keys file
echo "Creating a new authorized_keys file..."
touch "$AUTHORIZED_KEYS"

# Step 3: Concatenate all .pub files in the current directory into the new authorized_keys file
echo "Appending .pub files to the new authorized_keys..."
cat *.pub >> "$AUTHORIZED_KEYS"

echo "Process complete."
