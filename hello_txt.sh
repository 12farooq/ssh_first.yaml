#!/bin/bash

# This script creates a file named hello.txt

# Define the file content
file_content="Hello, this is the content of hello.txt."

# Create hello.txt file
echo "$file_content" > hello.txt

# Display a message indicating the file creation
echo "File hello.txt created with content:"
cat hello.txt