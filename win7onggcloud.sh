read -p $'\e[1;37mEnter your ngrok token: \e[0m' token
sudo apt update -y
sudo apt install apache2 ufw p7zip-full aria2 qemu-system-x86-64 -y
sudo ufw allow 'VNC'
sudo ufw status
if [ -e "./Tiny7.qcow2" ]; then
    echo "File exists"
else
    aria2c -x 4 -o file.7z 'https://archive.org/download/tiny-7.7z/Tiny7.7z'
    7za x file.7z
    rm -rf file.7z
fi
if [ -e "./ngrok" ]; then
    echo "File exists"
else
    wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
    tar -xvzf ngrok-v3-stable-linux-amd64.tgz
    rm -rf ngrok-v3-stable-linux-amd64.tgz
fi
./ngrok authtoken "$token"
rungrok="$(./ngrok tcp 5900)" &
clear
echo "----------\/----------"
echo "Please go to the following link to check if the generated address is working and connect using VNC: https://dashboard.ngrok.com/agents"
echo "----------/\----------"
sleep 10
sudo qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu qemu64,+sse,+sse2,+sse4.1,+sse4.2 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 2048M -drive file=Tiny7.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ac97 -device rtl8139,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -vnc :0
clear
echo "To run again, run the following command:"
echo "----------\/----------"
echo "rungrok="\$\(./ngrok tcp 5900\)" & sudo qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu qemu64,+sse,+sse2,+sse4.1,+sse4.2 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 2048M -drive file=Tiny7.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ac97 -device rtl8139,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -vnc :0"
echo "----------/\----------"