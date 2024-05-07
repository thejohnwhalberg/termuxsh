read -p $'\e[1;37mEnter the Enter your ngrok token: \e[0m' token
sudo apt update
sudo apt install apache2
sudo apt install ufw
sudo ufw allow 'VNC'
sudo ufw status wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xvzf ngrok-v3-stable-linux-amd64.tgz
rm -rf ngrok-v3-stable-linux-amd64.tgz
./ngrok authtoken "$token"
./ngrok tcp --region ap 5900
sudo apt-get update -y
sudo apt-get install -y qemu-system-x86-64
wget -O RTL8139F.iso 'https://drive.google.com/uc?export=download&id=1wDL8vo9mmYKw1HKXZzaYHoKmzSt_wXai'
wget -O Tiny10.qcow2 'https://archive.org/download/tiny-10_202205/Tiny10.qcow2'
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 -M q35 -m 8G -boot order=d -drive file=Tiny10.qcow2,aio=threads,cache=unsafe -drive file=RTL8139F.iso,media=cdrom -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -cpu core2duo -smp sockets=1,cores=4,threads=2 -vga std -device e1000,netdev=n0 -netdev user,id=n0 -device intel-iommu -accel tcg,thread=multi,tb-size=1024