#!/bin/bash
sudo adduser adminuser
echo 'adminuser:pass' | sudo chpasswd

sudo groupadd adminperm
echo '%adminperm ALL=(ALL:ALL) ALL' >> /etc/sudoers
usermod -a -G adminperm adminuser
groups adminuser

sudo adduser poweruser
id poweruser

echo 'poweruser ALL=(ALL:ALL) /usr/sbin/iptables' >> /etc/sudoers

sudo usermod -a -G adminuser poweruser

find / -type d -perm 4000 -exec ls -ld {} \;