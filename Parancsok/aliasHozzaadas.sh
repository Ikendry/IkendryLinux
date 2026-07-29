
read -p "Hozzá szeretnéd adni? (i/n): " valasz

# Kis- és nagybetűk kezelése (pl. I vagy i)
case "$valasz" in
    [iI][gG][eE][nn] | [iI])
        echo 'alias telepit="sudo apt install -y"' >> ~/.bashrc
        echo 'alias telepitd="sudo dpkg -i"' >> ~/.bashrc
        echo 'alias update="/home/bence/Letöltések/DefaultLinuxSetup/Parancsok/update.sh"' >> ~/.bashrc
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





