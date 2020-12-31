source $HOME/.config/nvim/vux/plugs.vim
source $HOME/.config/nvim/vux/configs.vim

source $HOME/.config/nvim/vux/themes/nord.vim
" source $HOME/.config/nvim/vux/themes/onedark.vim
" source $HOME/.config/nvim/vux/themes/codedark.vim
" source $HOME/.config/nvim/vux/themes/xcode.vim

source $HOME/.config/nvim/vux/plugs-config.vim

source $HOME/.config/nvim/vux/keymaps.vim
source $HOME/.config/nvim/vux/keymaps-coc.vim

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
