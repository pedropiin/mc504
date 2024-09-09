## Notes on VM

- Start VM
```shell
cd tmp
qemu-system-x86_64 -hda vm_disk_test_rocky.qcow2 -boot c -m 1024 -display gtk
```

- Run VM with custom bootloader
```shell
qemu-system-x86_64 -drive format=raw,file=bootloader.bin
```
