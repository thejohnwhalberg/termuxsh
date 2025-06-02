clear
echo "The owner of this script will not be responsible if any unexpected problems occur whether you edit this script or not. It will start in 10 seconds and you agree to this. To cancel press Ctrl + C."
sleep 10
clear
echo You are here! It wont take long. Just a moment...
echo Installing X11-repo...
pkg install x11-repo
echo Installing Pulseaudio
pkg install pulseaudio -y
echo Installing Proot-distro
pkg install proot-distro -y
echo Installing Ubuntu
proot-distro install ubuntu
echo Setting up Pulseaudio
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
echo You are done! Welcome to Ubuntu!
proot-distro login ubuntu