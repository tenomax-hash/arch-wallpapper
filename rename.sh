#!/bin/bash

# Set the directory where your files are located
directory="."

# Set the file type you want to target (e.g., txt, jpg, etc.)
file_type="jpg"

# Set the base name for the new files
new_name="wallpapper"
# new_name="wallpapper"

# Navigate to the directory
cd "$directory" || exit

# Initialize a counter for incremental naming
counter=1

# Loop through all files of the specified type in the directory
for old_file in *."$file_type"; do
    # Generate the new filename
    # new_file="${new_name}_${month}_${counter}.${file_type}"
    new_file="${new_name}_${counter}.${file_type}"

    # Check if the new filename already exists
    if [ -e "$new_file" ]; then
        # If it exists, overwrite the file
        mv -f "$old_file" "$new_file"
        echo "Overwritten: $old_file to $new_file"
    else
        # If it doesn't exist, rename the file
        mv "$old_file" "$new_file"
        echo "Renamed: $old_file to $new_file"
    fi

    # Increment the counter for the next file
    ((counter++))
done

