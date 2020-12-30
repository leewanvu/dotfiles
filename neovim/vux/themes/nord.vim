let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:airline_theme='nord'

augroup nord-theme-overrides
  autocmd!
  autocmd ColorScheme nord highlight Normal ctermbg=NONE guibg=NONE
  autocmd ColorScheme nord highlight VertSplit ctermbg=NONE guibg=NONE
  autocmd ColorScheme nord highlight SignColumn ctermbg=NONE guibg=NONE
  " PHP syntax highlight
  " autocmd ColorScheme nord hi! phpVarSelectorThis guifg=#5E81AC
  " autocmd ColorScheme nord hi! link phpUseClass phpClass
  " autocmd ColorScheme nord hi! link phpUseAlias phpClass
  " autocmd ColorScheme nord hi! link phpUseNamespaceSeparator phpClass
augroup END

colorscheme nord
