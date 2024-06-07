#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Install Python pip
if ! command -v pip3 &> /dev/null; then
    echo "pip3 not found, installing..."
    sudo apt update
    sudo apt install -y python3-pip
else
    echo "pip3 is already installed"
fi

# Install Python virtual environment package
if ! python3 -m venv --help &> /dev/null; then
    echo "python3-venv not found, installing..."
    sudo apt update
    sudo apt install -y python3-venv
else
    echo "python3-venv is already installed"
fi

# Create virtual environment
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
else
    echo "Virtual environment already exists"
fi

# Activate virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Install dependencies
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip3 install -r requirements.txt
else
    echo "requirements.txt not found, skipping dependency installation"
fi

# Open VSCode (ensure code command is available)
if command -v code &> /dev/null; then
    echo "Opening VSCode..."
    code .
else
    echo "VSCode is not installed or code command is not available"
fi
