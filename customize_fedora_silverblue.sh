#!/bin/bash

if [ "$USER" != "core" ]; then
    echo "This script must be run as Jenkins user"
    exit 1
fi

# Update the system
sudo rpm-ostree upgrade

# Remove GNOME and install Openbox
sudo rpm-ostree override remove gnome-shell
sudo rpm-ostree install openbox @^minimal-environment

# Install Chromium
sudo rpm-ostree install chromium

# Enable autologin for a user (replace YOUR_USER with your username)
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
echo -e "[Service]\nExecStart=\nExecStart=-/usr/sbin/agetty --autologin core --noclear %I $TERM" | sudo tee /etc/systemd/system/getty@tty1.service.d/override.conf

# Set Openbox to autostart Chromium in kiosk and incognito mode
mkdir -p ~/.config/openbox
# echo 'chromium-browser --kiosk --incognito &' > ~/.config/openbox/autostart
echo 'chromium-browser  --incognito &' > ~/.config/openbox/autostart

# Set Openbox as the default session
echo 'exec openbox-session' > ~/.xinitrc
