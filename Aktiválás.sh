#!/usr/bin/env bash

# Színek a megjelenítéshez
readonly GREEN="\e[32m"
readonly RED="\e[31m"
readonly YELLOW="\e[33m"
readonly RESET="\e[0m"

# A kulcsot tartalmazó rejtett fájl elérési útja (a pont teszi rejtetté)
readonly KULCS_FAJL=".license.key"

# Ellenőrizzük, hogy létezik-e a kulcsfájl
if [[ ! -f "$KULCS_FAJL" ]]; then
    echo -e "${RED}Hiba: A licencfájl ($KULCS_FAJL) nem található!${RESET}"
    exit 1
fi

# Beolvassuk a kulcsot a rejtett fájrból, és eltávolítjuk a felesleges sortöréseket/szóközöket
KULCS=$(cat "$KULCS_FAJL" | tr -d '[:space:]')

clear
read -rp "Írd be a License kulcsot: " valasz

# Kis- és nagybetűk függetlenítése
valasz_kisbetus="${valasz,,}"
helyes_gen="${KULCS,,}gen"

case "$valasz_kisbetus" in
    "$KULCS" | "$helyes_gen")
        echo -e "${GREEN}Sikeres aktiválás!${RESET}"
        ;;
    *)
        echo -e "${RED}Hibás kulcs! Kilépés...${RESET}"
        sleep 2
        clear
        echo -e "${YELLOW}Írd be a License kulcsot, különben nem tudod használni!${RESET}"
        sleep 2

        if [[ -f "./Aktiválás.sh" ]]; then
            exec ./Aktiválás.sh
        else
            echo -e "${RED}Hiba: Az Aktiválás.sh fájl nem található!${RESET}"
            exit 1
        fi
        ;;
esac
