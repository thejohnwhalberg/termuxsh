clear
echo "The owner of this script will not be responsible if any unexpected problems occur whether you edit this script or not. It will start in 10 seconds and you agree to this. To cancel press Ctrl + C."
sleep 10
clear
apk update
apk upgrade
curl -o qemu.apk http://dl-cdn.alpinelinux.org/alpine/v3.20/community/aarch64/qemu-9.0.1-r1.apk
curl -o aarch64.apk http://dl-cdn.alpinelinux.org/alpine/v3.20/community/aarch64/qemu-system-aarch64-9.0.1-r1.apk
curl -o ppc.apk http://dl-cdn.alpinelinux.org/alpine/v3.20/community/aarch64/qemu-system-ppc-9.0.1-r1.apk
curl -o x86_64.apk http://dl-cdn.alpinelinux.org/alpine/v3.20/community/aarch64/qemu-system-x86_64-9.0.1-r1.apk
curl -o i386.apk http://dl-cdn.alpinelinux.org/alpine/v3.20/community/aarch64/qemu-system-i386-9.0.1-r1.apk
apk add --allow-untrusted qemu.apk
apk add --allow-untrusted aarch64.apk
apk add --allow-untrusted ppc.apk
apk add --allow-untrusted x86_64.apk
apk add --allow-untrusted i386.apk
rm qemu.apk
rm aarch64.apk
rm ppc.apk
rm x86_64.apk
rm i386.apk
apk upgrade
clear
qemu-system-x86_64 --version