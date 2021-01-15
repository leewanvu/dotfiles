#!/usr/bin/env bash

read -p "Do you want to install ? y/n: " is_install

if [ "$is_install" == "n" ]; then
    echo "See you again!"
    exit 1;
fi

read -p "For mac? y/n: " is_mac

read -p "Use neovim nightly? y/n: " is_neovim_nightly

read -p "Link zsh? y/n: " is_link_zsh

print_bold() {
    printf "\x1b[1m$1\x1b[0m\n"
}

print_bold "Linking...";

if [ "$is_mac" == "y" ]; then
    folders=(alacritty nvim ranger zsh tmux)
else
    folders=(alacritty nvim ranger kitty zsh tmux)
fi

for folder in "${folders[@]}"; do
    linkfrom="$PWD/$folder"
    linkto="$HOME/.config/$folder"

    if [ "$folder" == "nvim" ] && [ "$is_neovim_nightly"  == "y" ]; then
      linkfrom="$PWD/nvim-nightly"
    fi

    if [ "$folder" == "alacritty" ] && [ "$is_mac" == "y" ]; then
      linkfrom="$PWD/alacritty-mac"
    fi

    if [ "$folder" == "zsh" ] && [ "$is_link_zsh" == "y" ]; then
      linkfrom="$PWD/.zshrc"
      linkto="$HOME/.zshrc"
    fi

    if [ "$folder" == "zsh" ]; then
      linkfrom="$PWD/.tmux.conf"
      linkto="$HOME/.tmux.conf"
    fi

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
