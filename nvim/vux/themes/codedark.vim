let g:airline_theme = 'codedark'
let g:codedark_conservative = 0

augroup codedark-theme-overrides
  autocmd!
  " autocmd ColorScheme codedark hi! Normal ctermbg=NONE guibg=NONE
  " autocmd ColorScheme codedark hi! EndOfBuffer ctermbg=NONE guibg=NONE
  " autocmd ColorScheme codedark hi! VertSplit ctermbg=NONE guibg=NONE
  " autocmd ColorScheme codedark hi! SignColumn ctermbg=NONE guibg=NONE
  " autocmd ColorScheme codedark hi! LineNr ctermbg=NONE guibg=NONE
  " autocmd ColorScheme codedark hi! link phpVarSelector phpIdentifier
  " autocmd ColorScheme codedark hi! link phpVarSelectorThis phpIdentifier
augroup END

colorscheme codedark

" hi Normal guibg=NONE ctermbg=NONE
" hi EndOfBuffer guifg=#1e1e1e guibg=NONE
" hi LineNr guibg=NONE
" hi SignColumn guibg=NONE
" hi VerSplit guibg=NONE guifg=NONE
