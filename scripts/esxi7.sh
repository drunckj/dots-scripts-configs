#!/bin/sh

virt-install \
--virt-type kvm \
--hvm \
--name esxi7 \
--os-variant=rhel7.0 \
--vcpus 4 \
--cpu host-passthrough \
--machine q35 \
--features kvm_hidden=on \
--ram 4086 \
--disk path="/media/storage/virt images/esxi7.qcow2",size=20,format=qcow2,sparse=true,bus=sata \
--check disk_size=off \
--graphics spice \
--video qxl \
--network bridge=br0,model=vmxnet3 \
--metadata title='ESXi 7.0' \
--cdrom "/media/storage/virt images/VMware-VMvisor-Installer-7.0U2a-17867351.x86_64.iso"
