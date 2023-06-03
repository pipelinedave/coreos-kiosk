#!/bin/bash

# Create a QCOW2 image from the customized Fedora Silverblue VM
qemu-img convert -f qcow2 -O qcow2 ./silverblue-openbox-chromium-kiosk.qcow2 output/image.qcow2

sudo chown -R jenkins:jenkins output
