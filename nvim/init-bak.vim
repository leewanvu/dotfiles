source $HOME/.config/nvim/vux/init.vim

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "php", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = { "c", "rust" },  -- list of language that will be disabled
"   },
"   indent = {
"     enable = true
"   }
" }
" EOF
"
" lua <<EOF
" require'lspconfig'.intelephense.setup{on_attach=require'completion'.on_attach}
" EOF

" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>

" let g:completion_enable_auto_popup = 1
" let g:completion_enable_snippet = 'UltiSnips'

" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
" set shortmess+=c
