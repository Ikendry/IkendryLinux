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


    echo -e "${BLUE}⚙️  Parancsok:${NC}"
    echo -e "${CYAN}----------------------------------------${NC}"
    if [ -d "Parancsok" ]; then
        ls -C --color=auto "Parancsok/"
    else
        echo -e "${NC}A(z) Parancsok mappa nem található.${NC}"
    fi
    echo ""


    echo -e "${BLUE}🚀 Programok:${NC}"
    echo -e "${CYAN}----------------------------------------${NC}"
    if [ -d "Programok" ]; then
        ls -C --color=auto "Programok/"
    else
        echo -e "${NC}A(z) Programok mappa nem található.${NC}"
    fi
    echo ""


    echo -e "${BLUE}🖼️  HáttérKépek (rekurzív):${NC}"
    echo -e "${CYAN}----------------------------------------${NC}"
    if [ -d "HáttérKépek" ]; then
        ls -R --color=auto "HáttérKépek/"
    else
        echo -e "${NC}A(z) HáttérKépek mappa nem található.${NC}"
    fi
    echo -e "${PURPLE}════════════════════════════════════════${NC}"
