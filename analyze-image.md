# mount image

```bash
> fdisk -lu picl-k3os-v0.21.5-k3s2r1-raspberrypi.img 
Disk picl-k3os-v0.21.5-k3s2r1-raspberrypi.img: 1 GiB, 1111490560 bytes, 2170880 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xacb5d085

Device                                    Boot  Start     End Sectors  Size Id Type
picl-k3os-v0.21.5-k3s2r1-raspberrypi.img1 *      2048  116735  114688   56M  c W95 FAT32 (LBA)
picl-k3os-v0.21.5-k3s2r1-raspberrypi.img2      118784 2070527 1951744  953M 83 Linux

# device 1: offset= 2048 * 512 = 1048576
> mkdir -p image/boot
> mount -o loop,offset=1048576 picl-k3os-v0.21.5-k3s2r1-raspberrypi.img image/boot

# device 2: offset= 118784 * 512 = 60817408
> mkdir -p image/root
> mount -o loop,offset=60817408 picl-k3os-v0.21.5-k3s2r1-raspberrypi.img image/root

# cleanup
> umount image/boot
> umount image/root
> rm -R image
```
