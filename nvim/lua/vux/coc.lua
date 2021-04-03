local M = {}

function M.setup()
  vim.fn.execute([[
    inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    inoremap <silent><expr> <C-r> coc#refresh()
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gD <Plug>(coc-type-definition)
    nmap <silent> gm <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
    nmap <silent> <leader>en <Plug>(coc-diagnostic-next)

    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    nmap <leader>af <Plug>(coc-codeaction)
    nmap <leader>ar <Plug>(coc-rename)
    xmap <leader>= <Plug>(coc-format-selected)
    nmap <leader>= <Plug>(coc-format-selected)

    command! -nargs=0 Format :call CocAction('format')
    command! -nargs=? Fold :call CocAction('fold', <f-args>)
    command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
  ]], '')
end

return M