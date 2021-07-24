#!/bin/bash

text=$1
id="winston-smithnode"
directory="/home/nym/.nym/mixnodes/winston-smithnode"
URL="https://github.com/nymtech/nym/releases/download/v0.11.0/nym-mixnode_linux_x86_64"

cd /home/nym

systemctl kill nym-mixnode
sleep 2
rm ./nym-mixnode_linux_x86_64
curl -L -s "$URL" -o "nym-mixnode_linux_x86_64"
chmod 777 ./nym-mixnode_linux_x86_64
sleep 2
sudo -u nym -H ./nym-mixnode_linux_x86_64 upgrade --id $id
sleep 2
sudo -u nym -H ./nym-mixnode_linux_x86_64 sign --id $id --text $text
