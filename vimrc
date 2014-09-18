call pathogen#infect()
filetype off
call pathogen#incubate()
syntax on
filetype plugin indent on
set nu!

let g:syntastic_javascript_jshint_conf = "~/.jshintrc"
let g:syntastic_python_checkers = ["flake8"]

set hlsearch
set smartcase
set incsearch

inoremap jj <Esc>

inoremap <Esc> <nop>
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

let g:syntastic_always_populate_loc_list = 1


function! <SID>LocationPrevious()
    try
        lprev
    catch /^Vim\%((\a\+)\)\=:E553/
        llast
    endtry
endfunction

function! <SID>LocationNext()
    try
        lnext
    catch /^Vim\%((\a\+)\)\=:E553/
        lfirst
    catch
        echo "No Errors :-)"
    endtry
endfunction

"moving through locations - used for syntastic mostly
nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> <c-l>    <Plug>LocationPrevious
nmap <silent> <c-L>    <Plug>LocationNext

"Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"emacs beginning/end - I just use these a lot in bash!
nnoremap <C-a> ^
nnoremap <C-e> $

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location
         Errors
    endif
endfunction

function! CheckSyntax()
    SyntasticCheck
endfunction

"bring up syntastic error list
nnoremap <silent> ; :<C-e>call ToggleErrors()<CR>

"syntax highlight json files
autocmd BufNewFile,BufRead *.json set ft=javascript

"syntax highlight gyp files
autocmd bufNewFile,BufRead *.gyp set ft=python


autocmd BufReadPost * call CheckSyntax()

let s:cwd = getcwd()
let g:syntastic_java_javac_classpath = s:cwd . "/bin/classes:" . s:cwd . "/libs/*.jar:" . "/usr/local/android/android-sdk-macosx/platforms/android-20/*.jar"

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g --follow ""'
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

set tabstop=2
set shiftwidth=2
set expandtab

""autocmd FileType c setlocal shiftwidth=4 tabstop=4 noexpandtab
""autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 noexpandtab

""vimclojure stuff
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

:command Sl set list!

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

let g:airline_powerline_fonts = 1
set laststatus=2

set guifont=Inconsolata\ for\ Powerline:h16
"colorscheme pastels
