clear
echo "The owner of this script will not be responsible if any unexpected problems occur whether you edit this script or not. It will start in 10 seconds and you agree to this. To cancel press Ctrl + C."
sleep 10
clear
echo "This script uses Pinggy for port forwarding."
echo
echo "------------------------------------------------"
echo
sudo apt update -y
sudo apt install apache2 ufw p7zip-full aria2 qemu-system-x86-64 -y
sudo ufw allow 'VNC'
sudo ufw status
clear
if [ -e "./Tiny7.qcow2" ]; then
    echo "File exists"
else
    aria2c -x 4 -o file.7z 'https://archive.org/download/tiny-7.7z/Tiny7.7z'
    7za x file.7z
    rm -rf file.7z
fi
clear

# This section starts QEMU and then waits for the VNC port to be ready before starting Pinggy
echo "clear" > start7.sh
echo 'echo "Starting QEMU in the background..."' >> start7.sh
# The -audiodev flag has been replaced with -no-audio to completely disable audio.
echo "sudo qemu-system-x86_64 -no-audio -usb -device usb-tablet -device usb-kbd -cpu qemu64,+sse,+sse2,+sse4.1,+sse4.2 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 2048M -drive file=Tiny7.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device rtl8139,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -vnc :0 &"  >> start7.sh

# This loop waits for the VNC port (5900) to be open before continuing
echo 'echo "Waiting for VNC server to initialize..."' >> start7.sh
echo 'while ! sudo ss -tln | grep -q ":5900" ; do' >> start7.sh
echo '    echo -n "." ' >> start7.sh
echo '    sleep 2' >> start7.sh
echo 'done' >> start7.sh
echo 'echo ""' >> start7.sh
echo 'echo "VNC server is ready!"' >> start7.sh

echo "clear" >> start7.sh
echo 'echo "Starting Pinggy tunnel..."' >> start7.sh
echo 'echo "The address to connect to via VNC will be provided by Pinggy below:"' >> start7.sh
echo "echo " >> start7.sh
echo 'ssh -p 443 -R0:127.0.0.1:5900 qr@free.pinggy.io' >> start7.sh

echo "clear" >> start7.sh
echo 'echo "To run again, run the following command:"' >> start7.sh
echo "echo " >> start7.sh
echo 'echo "-"' >> start7.sh
echo "echo " >> start7.sh
echo 'echo "./start7.sh"' >> start7.sh
chmod +x start7.sh
./start7.sh
