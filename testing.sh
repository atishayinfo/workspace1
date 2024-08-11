#!/bin/bash

echo "Installation started"

# Check if git is already installed
if git --version > /dev/null 2>&1; then
   echo "git is already installed"
else
# Upadte package list and install git
  sudo apt-get update
  sudo apt-get install -y git

fi
echo "Installation complete"
