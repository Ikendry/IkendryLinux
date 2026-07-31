#!/usr/bin/env bash

# Színek a megjelenítéshez
readonly GREEN="\e[32m"
readonly RED="\e[31m"
readonly YELLOW="\e[33m"
readonly RESET="\e[0m"

# A kulcsokat tartalmazó rejtett fájl elérési útja
readonly KULCS_FAJL=".license.key"

# Ellenőrizzük, hogy létezik-e a kulcsfájl
if [[ ! -f "$KULCS_FAJL" ]]; then
    echo -e "${RED}Hiba: A licencfájl ($KULCS_FAJL) nem található!${RESET}"
    exit 1
fi

clear
read -rp "Írd be a License kulcsot: " valasz

# Kis- és nagybetűk függetlenítése a beírt értéknél
valasz_kisbetus="${valasz,,}"
siker=false

# Végigmegyünk a fájl összes során (folyamat-helyettesítéssel a subshell elkerülésére)
while IFS= read -r sor || [[ -n "$sor" ]]; do
    # Eltávolítjuk a felesleges szóközöket/sortöréseket az aktuális sorból
    sor_tiszta=$(echo "$sor" | tr -d '[:space:]')

    # Ha üres sor, átugorjuk
    [[ -z "$sor_tiszta" ]] && continue

    helyes_gen="${sor_tiszta,,}gen"

    # Összehasonlítás a beírt kulccsal
    if [[ "$valasz_kisbetus" == "${sor_tiszta,,}" ]] || [[ "$valasz_kisbetus" == "$helyes_gen" ]]; then
        siker=true
        break
    fi
done < <(cat "$KULCS_FAJL")


if [[ "$siker" == true ]]; then
    echo -e "${GREEN}Sikeres aktiválás!${RESET}"


    if [ -d "Parancsok" ]; then
        chmod -R +x Parancsok/
    fi

    Parancsok/programok_fajlok.sh
else
    echo -e "${RED}Hibás kulcs! Kilépés...${RESET}"
    echo "A License kulcsot itt tudod beszerezni: https://github.com/Ikendry/IkendryLinux"
    sleep 5
    clear
    echo -e "${YELLOW}Írd be a License kulcsot, különben nem tudod használni!${RESET}"
    sleep 2
    if [[ -f "./Aktiválás.sh" ]]; then
        exec ./Aktiválás.sh
    else
        echo -e "${RED}Hiba: Az Aktiválás.sh fájl nem található!${RESET}"
        exit 1
    fi
fi
