let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['^node_modules$[[dir]]', '\.git$[[dir]]']
let NERDTreeQuitOnOpen=1
let NERDTreeStatusline=''
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeWinSize=40

" Hide / end of folder
augroup nerdtreehidecwd
    autocmd!
    autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end
