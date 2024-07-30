#!/bin/bash

if [[ -z "$1" ]]; then
    echo "🔴 You need to provide one argument"
fi

if pacman -Qs $1 > /dev/null ; then
    echo "🟢 '$1' is already installed."
    exit 0
fi

# If PARU is not installed

echo "🔴 '$1' is not installed."

# Prompt
read -p "Do you want to install '$1'? (y/N)? " choice
case "$choice" in 
  y|Y ) 
    CURRENT_DIR="$(pwd)"
    WDIR="/tmp/dotfiles/$1"

    mkdir -p $WDIR 
    cd "$WDIR"

    AUR_URL="https://aur.archlinux.org/$1.git"
    git clone "${AUR_URL}" || ( echo "🔴 Cannot find git repository in '${AUR_URL}'." && exit 1 )
    cd $1
    makepkg -si || ( echo "🔴 Cannot install the package." && exit 1 )

    cd "$CURRENT_DIR"

    rm -rf "${WDIR}"

    ;;
    
  * ) 
    exit 0
    ;;
esac
