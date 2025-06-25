clear
echo "The owner of this script will not be responsible if any unexpected problems occur whether you edit this script or not. It will start in 10 seconds and you agree to this. To cancel press Ctrl + C."
sleep 10
clear
echo "New to Ngrok? Create an account or get token here: https://dashboard.ngrok.com/get-started/your-authtoken"
echo 
echo "-"
echo 
read -p $'\e[1;37mEnter your ngrok token: \e[0m' token
clear
sudo apt update -y
sudo apt install apache2 ufw p7zip-full aria2 qemu-system-x86-64 -y
sudo ufw allow 'VNC'
sudo ufw status
clear
if [ -e "./11.vhd" ]; then
    echo "File exists"
else
    aria2c -x 4 -o file.7z 'https://archive.org/download/windows-11-validation-os.-7z/Windows%2011%20Validation%20OS.7z'
    7za x file.7z
    rm -rf file.7z
fi
clear
if [ -e "./ngrok" ]; then
    echo "File exists"
else
    wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
    tar -xvzf ngrok-v3-stable-linux-amd64.tgz
    rm -rf ngrok-v3-stable-linux-amd64.tgz
fi
./ngrok authtoken "$token"
echo 'rungrok="$(./ngrok tcp 5900)" &' > start11vos.sh
echo "clear" >> start11vos.sh
echo 'echo "Just a moment..."' >> start11vos.sh
echo "sleep 10" >> start11vos.sh
echo "clear" >> start11vos.sh
echo 'echo "The address to connect to via VNC is below. If you do not see anything below, try checking here: https://dashboard.ngrok.com/agents"' >> start11vos.sh
echo "echo " >> start11vos.sh
echo 'echo "-"' >> start11vos.sh
echo "echo " >> start11vos.sh
echo "curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url\":\"tcp:..([^\"]*).*/\1/p'" >> start11vos.sh
echo "sleep 10" >> start11vos.sh
echo "sudo qemu-system-x86_64 -M q35 -cpu qemu64 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=11.vhd,aio=threads,cache=unsafe -vga std -device ich9-intel-hda -device hda-duplex -device igb,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -drive file=OVMF.fd,format=raw,readonly=on,if=pflash -drive file=RELEASEX64_OVMF_VARS.fd,format=raw,if=pflash -device intel-iommu -monitor stdio -vnc :0"  >> start11vos.sh
echo "clear" >> start11vos.sh
echo 'echo "To run again, run the following command:"' >> start11vos.sh
echo "echo " >> start11vos.sh
echo 'echo "-"' >> start11vos.sh
echo "echo " >> start11vos.sh
echo 'echo "./start11vos.sh"' >> start11vos.sh
chmod +x start11vos.sh
./start11vos.sh