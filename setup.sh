#!/usr/bin/sh

# Install dependencies
echo "Installing dependencies. You may be asked to enter your password."
sudo apt-get install git dcraw gphoto2 imagemagick

# Create directories
echo "Making directories..."
mkdir 'import'
mkdir 'export'
mkdir 'config'
