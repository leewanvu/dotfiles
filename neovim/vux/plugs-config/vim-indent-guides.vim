let g:indent_guides_tab_guides = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'fzf']
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#2C323C ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2C323C ctermbg=4

