#!/bin/bash
set -e

sudo apt update -y || true

if ! dpkg -l | grep -q apache2; then
    sudo apt install apache2 -y || true
fi

sudo systemctl daemon-reexec || true
sudo systemctl daemon-reload || true
sudo systemctl start apache2 || true
sudo systemctl enable apache2 || true
