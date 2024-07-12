#!/bin/bash

# Function to confirm deletion with user input
confirm_deletion() {
  local directory=$1

  read -r -p "This script will remove the following directory permanently:

  * $directory

  Are you sure you want to proceed? (y/N): " response

  case "$response" in
    [yY])
      echo "Confirmed: Deleting directory."
      return 0  # Proceed with deletion
      ;;
    *)
      echo "Deletion cancelled."
      return 1  # Don't proceed
      ;;
  esac
}

# List of directories to remove
directories=(
  "/cdr/NSN/202405??"
  "/cdr/ERICSSON/2024050?"
  "/cdr/FULLDECODE/fulldecode_BI/ericsson/202405??"
  # Add more directories as needed
)

# Confirm deletion for each directory
for directory in "${directories[@]}"; do
  if ! confirm_deletion "$directory"; then
    echo "Skipping removal of $directory."
    continue
  fi

  echo "Removing directory: $directory"
  if ! rm -rf "$directory"; then
    echo "Error: Failed to remove directory '$directory'."
    exit 1  # Exit on error
  fi
done

echo "Deletion completed successfully."
