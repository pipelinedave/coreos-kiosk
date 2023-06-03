#!/bin/bash

# Set the username and password
username=core
password=kiosk

# Path to your Fedora Silverblue ISO
iso_path=./Fedora-Silverblue-ostree-x86_64-38-1.6.iso

# Create a QCOW2 image for the VM
qemu-img create -f qcow2 fedora-silverblue.qcow2 20G

# Create a virtual machine with Fedora Silverblue
virt-install --name silverblue --ram 4096 --vcpus 4 --disk path=./fedora-silverblue.qcow2,format=qcow2 --os-variant fedora38 --graphics none --location /home/feddy/src/coreos-kiosk/Fedora-Silverblue-ostree-x86_64-38-1.6.iso --extra-args 'console=ttyS0,115200n8 serial inst.text inst.ks=https://raw.githubusercontent.com/pipelinedave/coreos-kiosk/master/ks.cfg'



# Wait for the installation to finish
echo "Waiting for the installation to finish..."
while ! ping -c 1 -W 1 $ip; do
    sleep 1
done


# Start the VM
virsh start silverblue

# Wait for the VM to start
echo "Waiting for the VM to start..."
while ! ssh -o ConnectTimeout=1 Jenkins@$ip true; do
    sleep 1
done

# Copy the customization script to the VM
echo "Copying the customization script to the VM..."
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null customize_fedora_silverblue.sh $username@localhost:/home/$username

# Run the customization script in the VM
echo "Running the customization script in the VM..."
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $username@localhost 'chmod +x customize_fedora_silverblue.sh; sudo ./customize_fedora_silverblue.sh'

# Done
echo "VM is set up and ready to use."
