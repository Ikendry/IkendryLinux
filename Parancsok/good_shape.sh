#!/usr/bin/env bash

# good_shape.sh
#
# update script for Linux Debian

echo "========================================"
echo "            UPDATE SCRIPT               "
echo "========================================"

sudo dpkg --configure -a
sudo apt -f install
sudo apt --fix-missing install
sudo apt clean
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade
sudo apt clean
sudo apt autoremove

sudo apt update -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove
sudo do-release-upgrade

echo "========================================"
echo "            UPDATE SCRIPT               "
echo "========================================"
sleep 5
clear
echo "========================================"
echo "            ÚjraInditási Kérelem        "
echo "========================================"
read -p "Szeretnéd Újraindítani? (i/n): " valasz

# Kis- és nagybetűk kezelése (pl. I vagy i)
case "$valasz" in
    [iI][gG][eE][nn] | [iI])
        echo "ÚjraInditás 3..."
        sleep 1
        echo "ÚjraInditás 2.."
        sleep 1
        echo "ÚjraInditás 1."
        sleep 1
        sudo reboot
        ;;
    [nN][eE][mM] | [nN])
        echo "Kilépés..."
        clear
        exit 0
        ;;
    *)
        echo "Érvénytelen válasz! Kérlek, igent (i) vagy nemet (n) adj meg."
        ;;
esac
echo "========================================"
echo "            ÚjraInditási Kérelem        "
echo "========================================"
