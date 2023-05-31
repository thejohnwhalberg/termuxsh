echo You are here! It wont take long. Just a moment...
echo Installing X11-repo...
pkg install x11-repo
echo Installing Pulseaudio
pkg install pulseaudio -y
echo Installing Proot-distro
pkg install proot-distro -y
echo Installing Ubuntu
proot-distro install ubuntu
echo You are done! Welcome to Ubuntu!
proot-distro login ubuntu