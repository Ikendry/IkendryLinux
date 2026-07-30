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

# Eredmény kiértékelése
if [[ "$siker" == true ]]; then
    echo -e "${GREEN}Sikeres aktiválás!${RESET}"

    # Biztonságosabb jogosultság beállítás (777 helyett csak futtathatóság)
    if [ -d "Parancsok" ]; then
        chmod -R +x Parancsok/
    fi

    # Színek definíciója a menühöz
    BLUE='\033[1;34m'
    GREEN_M='\033[1;32m'
    CYAN='\033[1;36m'
    PURPLE='\033[1;35m'
    NC='\033[0m'

    clear
    echo -e "${PURPLE}╔════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║            RENDSZER ÁTTEKINTÉS         ║${NC}"
    echo -e "${PURPLE}╚════════════════════════════════════════╝${NC}"
    echo ""

    # Parancsok szekció
    echo -e "${BLUE}⚙️  Parancsok:${NC}"
    echo -e "${CYAN}----------------------------------------${NC}"
    if [ -d "Parancsok" ]; then
        ls -C --color=auto "Parancsok/"
    else
        echo -e "${NC}A(z) Parancsok mappa nem található.${NC}"
    fi
    echo ""

    # Programok szekció
    echo -e "${BLUE}🚀 Programok:${NC}"
    echo -e "${CYAN}----------------------------------------${NC}"
    if [ -d "Programok" ]; then
        ls -C --color=auto "Programok/"
    else
        echo -e "${NC}A(z) Programok mappa nem található.${NC}"
    fi
    echo ""

    # Háttérképek szekció
    echo -e "${BLUE}🖼️  HáttérKépek (rekurzív):${NC}"
    echo -e "${CYAN}----------------------------------------${NC}"
    if [ -d "HáttérKépek" ]; then
        ls -R --color=auto "HáttérKépek/"
    else
        echo -e "${NC}A(z) HáttérKépek mappa nem található.${NC}"
    fi
    echo -e "${PURPLE}════════════════════════════════════════${NC}"
else
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
fi
