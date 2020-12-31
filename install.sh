#!/usr/bin/env bash

read -p "Do you want to install ? y/n: " is_install

if [ "$is_install" == "n" ]; then
    echo "See you again!"
    exit 1;
fi

print_bold() {
    printf "\x1b[1m$1\x1b[0m\n"
}

print_bold "Linking...";

folders=(alacritty nvim ranger kitty)

for file in "${folders[@]}"; do
    linkfrom="$PWD/$file"
    linkto="$HOME/.config/$file"

    echo "Remove $linkto";
    rm -rf $linkto

    echo "Link from $linkfrom to $linkto";
    ln -s $linkfrom $linkto
done

print_bold "Linked.";

print_bold "Install packer"

packer="$HOME/.local/share/nvim/site/pack/packer/opt/packer.nvim"
[ ! -d "$packer" ] && git clone https://github.com/wbthomason/packer.nvim "$packer"

print_bold "Done!"
