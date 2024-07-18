#!/bin/bash
sudo apt update -y
sudo apt install wget -y

if [ ! -f "ngrok" ]; then
    wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
    tar -zxvf ngrok.tgz
fi
if ! grep -q "authtoken: 2caMIyH98jojFijfUDA9HHKZDZ0_2naziucGo1SjGJ4xWL8QM" ~/.ngrok2/ngrok.yml 2>/dev/null; then
    ./ngrok config add-authtoken 2caMIyH98jojFijfUDA9HHKZDZ0_2naziucGo1SjGJ4xWL8QM
fi
if ! pgrep -f "ngrok http 8006" > /dev/null; then
    ./ngrok http 8006 --region ap &>/dev/null &
fi
sudo mkdir /isos/
if [ ! -f "/isos/a.iso" ]; then
    sudo wget -O /isos/a.iso https://computernewb.com/isos/windows/Win10_22H2_English_x64.iso
fi
if [ ! -f "/isos/driver.iso" ]; then
    sudo wget -O /isos/driver.iso https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.240-1/virtio-win-0.1.240.iso
fi
if [ ! -f "compose.yaml" ]; then
    wget https://raw.githubusercontent.com/RyuiMinh/ActionDocker/main/bacom/two/compose.yaml
fi
echo "Successfully connected to port 8006"
sudo docker compose up
