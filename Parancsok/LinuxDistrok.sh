echo "(0.Kilépés,1.Kubuntu,2.Ubuntu,3.Kali,4.LinuxMint,5.UbuntuStudio)"
read -p "Melyik linuxra?:" valasz

# Kis- és nagybetűk kezelése (pl. I vagy i)
case "$valasz" in
    [1][gG][eE][nn] | [1])
        echo "Kubuntu"

        ;;
    [2][gG][eE][nn] | [2])
        echo "Ubuntu"

        ;;
    [3][gG][eE][nn] | [3])
        echo "Kali"

        ;;
    [4][gG][eE][nn] | [4])
        echo "LinuxMint"

        ;;
    [5][gG][eE][nn] | [5])
        echo "UbuntuStudio"

        ;;
    [0][eE][mM] | [0])
        echo "Kilépés..."
        clear
        exit 0
        ;;
    *)
        echo "Érvénytelen válasz! Kérlek, 0-5 adjon meg számokat!"
        ;;
esac
