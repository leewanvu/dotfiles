#!/usr/bin/env bash

# read -p "install configs ? y/n: " is_install
#
# if [ "$is_install" == "n" ]; then
#     echo "See you again!"
#     exit 1;
# fi

print_bold() {
    printf "\x1b[1m$1\x1b[0m\n"
}

# print_bold "$PWD/neovim";
# print_bold "$HOME/.configs";

for file in *; do
    linkto="$HOME/.config/$file"
    linkfrom="$PWD/$file"

    echo "Link from: $linkfrom to $linkto"
done
