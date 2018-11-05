#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Debian based distro
# How to run:
#   $ curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/printer-scanner/install_printer_scanner.sh | sudo sh

set -x

# Load utility functions script
wget -q https://raw.githubusercontent.com/solomonxie/cdn/master/utils.sh ~/utils.sh
source ~/utils.sh

do_install_printer_scanner_by_os(){
    # Get Distro
    case $(get_distro) in
        "ubuntu")
            install_printer_ubuntu 
            install_scanner_ubuntu ;;
        "raspbian")
            install_printer_rpi
            install_scanner_rpi ;;
    esac
}

install_printer_ubuntu(){
    sudo apt-get install cups -y
    sudo usermod -aG lpadmin $USER
    sudo cupsctl --remote-any
    # Process to this url to manage printers:
    # https://ServerIP:631/
}
install_printer_rpi(){
    sudo apt-get install cups -y
    sudo usermod -aG lpadmin $USER
    sudo cupsctl --remote-any
    # Process to this url to manage printers:
    # https://ServerIP:631/
}

install_scanner_ubuntu(){
    sudo apt install sane -y
    # List all Scan devices with Names
    scanimage -L
    # Scan an image
    scanimage -d "DeviceName" –-format=tiff > sample.tiff
}

install_scanner_rpi(){
    sudo apt install sane -y
    # List all Scan devices with Names
    scanimage -L
    # Scan an image
    scanimage -d "DeviceName" –-format=tiff > sample.tiff
}


# Entry Point:
do_install_printer_scanner_by_os