#!/bin/bash

# Create a QCOW2 image from the customized Fedora Silverblue VM
qemu-img convert -f qcow2 -O qcow2 ./silverblue-openbox-chromium-kiosk2.qcow2 output/image.qcow2
