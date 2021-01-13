let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 0

" function! StartifyEntryFormat()
"     return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
" endfunction

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'a': '~/.config/alacritty/alacritty.yml' },
            \ { 'z': '~/.zshrc' },
            \ { 't': '~/.tmux.conf' },
            \ { 's': '~/FireApps/sms-be' },
            \ { 'u': '~/FireApps/unlimited-be' },
            \ { 'd': '~/FireApps/s5y-docker' },
            \ { 'al': '~/FireApps/ar/alireviews' },
            \ { 'ar': '~/FireApps/ar/alireviews-report' },
            \ { 'ab': '~/FireApps/ar/alireviews-box' },
            \ ]

let g:startify_enable_special = 0
