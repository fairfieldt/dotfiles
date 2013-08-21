[ -f ~/.paths ] && . ~/.paths
[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.extra ] && . ~/.extra

alias cp='cp -v'
alias ls='ls -G'
alias ll='ls -lh'
alias sl='ls'
alias cls='clear'

#only if we have hub installed
hash hub 2>/dev/null && alias git=hub

function shortcut() {
	echo $1$2
	cd "$1$2"
	ls
}

function gc() {
	shortcut "$HOME/dev/gameclosure/" $1
}

function dev() {
	shortcut "$HOME/dev/" $1
}



function g() { grep -srn "$@" *; }
function f() { find . -name "$@"; }


if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	c_reset='\[\e[0m\]'
	c_user='\[\033[1;33m\]'
	c_path='\[\e[0;33m\]'
	c_git_clean='\[\e[0;36m\]'
	c_git_dirty='\[\e[0;35m\]'
else
    c_reset=
    c_user=
    c_path=
    c_git_clean=
    c_git_dirty=
fi

git_prompt ()
{
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi
 
    git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
 
    if git diff --quiet 2>/dev/null >&2; then
        git_color="${c_git_clean}"
    else
        git_color=${c_git_dirty}
    fi
 
    echo " [$git_color$git_branch${c_reset}]"
}

function osx_bash_completion()
{
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi
	if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
		. `brew --prefix`/etc/bash_completion.d/git-prompt.sh
	fi
}

hash brew 2>/dev/null && osx_bash_completion

ulimit -S -n 1024
#\W \[\033[0;37m\]"
path="\W"
green="\[\033[01;32m\]"
blue="\[\033[01;34m\]"
yellow="\[\033[0;33m\]"
white="\[\033[00m\]"
if [ $FANCY_HOSTNAME ]; then
	hostsymbol=$FANCY_HOSTNAME
else
	hostsymbol=$(hostname -f)
fi
export PS1=$green$path$yellow'$(__git_ps1) '$blue''$hostsymbol' : '$white
export LSCOLORS='ExGxFxdxCxDxDxBxBxExEx'
export TERM=xterm-color


