call pathogen#infect()
filetype off
call pathogen#incubate()
syntax on
filetype plugin indent on
set nu!

let g:syntastic_javascript_jshint_conf = "~/.jshintrc"

set hlsearch
set smartcase
set incsearch

inoremap jj <Esc>

inoremap <Esc> <nop>

set backupdir=~/.vim/backup
set directory=~/.vim/swap

"Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location
         Errors
    endif
endfunction

"bring up syntastic error list
nnoremap <silent> ; :<C-e>call ToggleErrors()<CR>

"syntax highlight json files
autocmd BufNewFile,BufRead *.json set ft=javascript

"syntax highlight gyp files
autocmd bufNewFile,BufRead *.gyp set ft=python


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"" highlight lines over 80
""highlight OverLength ctermbg=red ctermfg=white guibg=#592929
""match OverLength /\%81v.\+/

""
set wrap linebreak textwidth=0



""color column 80
set colorcolumn=80

""tell slime to use tmux
let g:slime_target = "tmux"

set tabstop=4
set shiftwidth=4
set expandtab

""vimclojure stuff
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1



"" remember spot in files
" Tell vim to remember certain things when we exit
" "  '100  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :200  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
"

function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END
