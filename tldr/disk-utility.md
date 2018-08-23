# Disk Utilities

## Mount Disks
- FAT32 disk
    `sudo mount -t vfat /dev/sda1 ~/drive`
- NTFS disk
    ```
    sudo apt-get install ntfs-3g
    sudo mount -t ntfs-3g /dev/sda1 ~/drive
    ```
- ExFat disk
    ```
    # For Raspberry Pi
    sudo apt-get install exfat-fuse
    # For ubuntu
    sudo apt-get install exfat-utils

    # Mount
    sudo mount -t exfat /dev/sda1 ~/drive
    ```

## List Connected Devices
- List devices
    - `lsblk`
    - `df -h`
    - `fdisk -l`
