call pathogen#infect()
filetype off
call pathogen#incubate()
syntax on
filetype plugin indent on
set nu!

set hlsearch
set smartcase
set incsearch

inoremap jj <Esc>

inoremap <Esc> <nop>

set backupdir=~/.vim/backup
set directory=~/.vim/swap

"Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"syntax highlight json files
autocmd BufNewFile,BufRead *.json set ft=javascript

"syntax highlight gyp files
autocmd bufNewFile,BufRead *.gyp set ft=python


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

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
