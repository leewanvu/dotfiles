" set leader key
let g:mapleader = " "

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :bd<CR>
nnoremap <leader>n :nohlsearch<CR>

" NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

" NvimTreeToggle
" nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <C-m> :NvimTreeFindFile<CR>

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" Shirt+Tab will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Ranger
map <leader>r :Ranger<CR>

" fzf
nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>g :GFiles?<CR>
" nnoremap <silent> <Leader>f :Rg<CR>
" nnoremap <silent> <Leader>/ :BLines<CR>
" nnoremap <silent> <Leader>' :Marks<CR>
" nnoremap <silent> <Leader>h :History<CR>

" Tagbar Toggle
" nmap <Leader>t :TagbarToggle<CR>

" Easy motion
" <Leader>f{char} to move to {char}
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

" Use control-c instead of escape
nnoremap <silent> <C-c> <Esc>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap jk <ESC>
inoremap kj <ESC>

imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" ***********************************************************************
" visual mode
" ***********************************************************************
" Better indenting
vnoremap < <gv
vnoremap > >gv

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" ***********************************************************************
" Terminal window navigation
" ***********************************************************************
" tnoremap <C-h> <C-\><C-N><C-w>h
" tnoremap <C-j> <C-\><C-N><C-w>j
" tnoremap <C-k> <C-\><C-N><C-w>k
" tnoremap <C-l> <C-\><C-N><C-w>l
" inoremap <C-h> <C-\><C-N><C-w>h
" inoremap <C-j> <C-\><C-N><C-w>j
" inoremap <C-k> <C-\><C-N><C-w>k
" inoremap <C-l> <C-\><C-N><C-w>l
" tnoremap <Esc> <C-\><C-n>

" Toggle transparent background color
" nmap <Leader>l :call onedark#ToggleTransparent()<CR>
