apk update
apk upgrade
curl -o qemu.apk http://dl-cdn.alpinelinux.org/alpine/v3.20/community/aarch64/qemu-9.0.1-r1.apk
curl -o aarch64.apk http://dl-cdn.alpinelinux.org/alpine/v3.20/community/aarch64/qemu-aarch64-9.0.1-r1.apk
curl -o ppc.apk http://dl-cdn.alpinelinux.org/alpine/v3.20/community/aarch64/qemu-system-ppc-9.0.1-r1.apk
curl -o x86_64.apk http://dl-cdn.alpinelinux.org/alpine/v3.20/community/aarch64/qemu-system-x86_64-9.0.1-r1.apk
curl -o i386.apk http://dl-cdn.alpinelinux.org/alpine/v3.20/community/aarch64/qemu-i386-9.0.1-r1.apk
apk add --allow-untrusted qemu.apk
apk add --allow-untrusted aarch64.apk
apk add --allow-untrusted ppc.apk
apk add --allow-untrusted x86_64.apk
apk add --allow-untrusted i386.apk
apk upgrade
qemu-system-x86_64 --version
