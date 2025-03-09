read -p $'\e[1;37mEnter your ngrok token: \e[0m' token
sudo apt update -y
sudo apt install apache2 ufw p7zip-full qemu-system-x86-64 -y
sudo ufw allow 'VNC'
sudo ufw status
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xvzf ngrok-v3-stable-linux-amd64.tgz
rm -rf ngrok-v3-stable-linux-amd64.tgz
./ngrok authtoken "$token"
./ngrok tcp --region ap 5900 &>/dev/null
wget -O 10.7z 'https://archive.org/download/windows-xp.-7z_202408/Windows%20XP.7z'
7za x 10.7z
rm -rf 10.7z
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 -cpu core2duo,+avx -usb -device usb-kbd -device usb-tablet -smp sockets=1,cores=4,threads=1 -m 512M -hda XP.qcow2 -vga vmware -device ac97 -device e1000,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -vnc :0