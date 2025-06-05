clear
echo "The owner of this script will not be responsible if any unexpected problems occur whether you edit this script or not. It will start in 10 seconds and you agree to this. To cancel press Ctrl + C."
sleep 10
clear
sudo apt update -y
sudo apt install apache2 p7zip-full qemu-kvm aria2 -y
if [ -e "./W89200.qcow2" ]; then
    echo "File exists"
else
    aria2c -x 4 -o file.7z 'https://archive.org/download/windows-8-9200.7znbabtermux/Windows%208%209200.7z'
    7za x file.7z
    rm -rf file.7z
fi
clear
echo "qemu-system-x86_64 -M q35 -device qemu-xhci -device usb-tablet -device usb-kbd -cpu qemu64,+avx,+avx2,+sse,+sse2,+sse4.1,+sse4.2,hv-relaxed -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M,slots=4,maxmem=4097M -object memory-backend-ram,size=1024M,id=m0 -numa node,nodeid=0,memdev=m0,cpus=0 -object memory-backend-ram,size=1024M,id=m1 -numa node,nodeid=1,memdev=m1,cpus=1 -object memory-backend-ram,size=1024M,id=m2 -numa node,nodeid=2,memdev=m2,cpus=2 -object memory-backend-ram,size=1024M,id=m3 -numa node,nodeid=3,memdev=m3,cpus=3 -drive file=W89200.qcow2,aio=threads,cache=unsafe,if=virtio -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel kvm -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu" > run8.sh
chmod +rwx run8.sh
echo "To run, run the following command:"
echo "----------\/----------"
echo "./run8.sh"
echo "----------/\----------"
./run8.sh
clear
echo "To run again, run the following command:"
echo "----------\/----------"
echo "./run8.sh"
echo "----------/\----------"