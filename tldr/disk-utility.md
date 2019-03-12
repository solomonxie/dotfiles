# Disk Utilities
- Check Device file system
    `sudo file -s /dev/sda1`
- Format device (Make file system)
    `sudo mkfs -t ext4 /dev/sda1`

## Mount Disks
- Mount all disks defined in fstab
    `sudo mount -a`
- FAT32 disk
    `sudo mount -t vfat /dev/sda1 /udisk`
- NTFS disk
    ```
    sudo apt-get install ntfs-3g
    sudo mount -t ntfs-3g /dev/sda1 /udisk
    ```
- ExFat disk
    ```
    # For Raspberry Pi
    sudo apt-get install exfat-fuse
    # For ubuntu
    sudo apt-get install exfat-utils

    # Mount
    sudo mount -t exfat /dev/sda1 /udisk
    ```

## List Connected Devices
- List devices
    - `lsblk` list all connected
    - `df -h` list all mounted
    - `sudo fdisk -l`
- List devices by meta-info
    - `ls -l /etc/disk/by-id` list ID
    - `ls -l /etc/disk/by-uuid` list UUID
    - `ls -l /etc/disk/by-partuuid` list partition-uuid
    - `ls -l /etc/disk/by-label` list Label
    - `ls -l /etc/disk/by-path` list path

## fstab
- Forbit auto-mount & build Device->Folder mapping
    `UUID=5B7D-9E47 /udisk exfat noauto 0 0`