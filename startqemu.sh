#!/data/data/com.termux/files/usr/bin/bash

nohup qemu-system-x86_64 -machine q35 -m 6144 -smp cpus=6 -cpu qemu64 \
  -drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-x86_64-code.fd \
  -netdev user,id=n1,hostfwd=tcp::2222-:22,hostfwd=tcp::3306-:3306,hostfwd=tcp::5900-:5900,hostfwd=tcp::5901-:5901,hostfwd=tcp::8080-:8080,hostfwd=tcp::9000-:9000,hostfwd=tcp::8000-:8000,hostfwd=tcp::9090-:9090,hostfwd=tcp::4000-:4000,hostfwd=tcp::8001-:8001,hostfwd=tcp::19999-:19999,hostfwd=tcp::6000-:6000,hostfwd=tcp::7000-:7000,hostfwd=tcp::8081-:8081,hostfwd=tcp::1443-:1443,hostfwd=tcp::1080-:1080,hostfwd=tcp::9443-:9443 -device virtio-net,netdev=n1 \
  -nographic alpine.img > qemu.log 2>&1 &
