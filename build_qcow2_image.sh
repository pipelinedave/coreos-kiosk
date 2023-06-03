#!/bin/bash

# Create a QCOW2 image from the customized Fedora Silverblue VM
qemu-img convert -f qcow2 -O qcow2 /path/to/vm/disk.qcow2 output/image.qcow2
