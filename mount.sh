#!/usr/bin/env bash

# extend auto_master with auto_nfs
echo '/ auto_nfs -nobrowse,nosuid' >> /etc/auto_master

# mount NFS shares
cat << EOF > /etc/auto_nfs
/System/Volumes/Data/Users/kessl/odroid-nas -fstype=nfs,noowners,nolockd,locallocks,rdirplus,hard,intr,rw,tcp,nfc,rsize=65536,wsize=65536 nfs://odroid-nas:/mnt/hdd/data
EOF

# remount auto_master
automount -cv
