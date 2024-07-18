sudo apt update -y
sudo apt install wget curl -y
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -zxvf ngrok.tgz
./ngrok config add-authtoken 2caMIyH98jojFijfUDA9HHKZDZ0_2naziucGo1SjGJ4xWL8QM
./ngrok http 8006 --region ap &>/dev/null &
sudo mkdir /isos/
sudo wget -O /isos/a.iso https://computernewb.com/isos/windows/Windows%20Server%202012%20R2.iso &>/dev/null &
while ps axg | grep -vw grep | grep -w wget > /dev/null; do sleep 1; done
sudo wget -O /isos/driver.iso https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/
virtio-win-0.1.240-1/virtio-win-0.1.240.iso &>/dev/null &
while ps axg | grep -vw grep | grep -w wget > /dev/null; do sleep 1; done
wget https://raw.githubusercontent.com/RyuiMinh/ActionDocker/main/compose.yaml
echo "Successfully connected to port 8006"
sudo docker compose up
