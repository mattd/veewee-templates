#!/bin/sh

date > /etc/vagrant_box_build_time

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)

yum -y update

yum -y install curl wget

cd /tmp
wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop,ro VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions_$VBOX_VERSION.iso

curl -L http://opscode.com/chef/install.sh | bash

exit

# EOF
