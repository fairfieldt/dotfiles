# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="norm"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/fairfieldt/dev/checker:/usr/local/Cellar/android-ndk/r7c:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/Cellar/android-sdk/r18/platform-tools:/usr/local/Cellar/android-sdk/r18/tools:/Users/fairfieldt/node_modules/bin:/opt/local/bin:/Users/fairfieldt/dev/leiningen:/Users/fairfieldt/dev/NVPACK/android-sdk-macosx/tools:/Users/fairfieldt/dev/NVPACK/apache-ant-1.8.2/bin:/usr/local/bin/checker:/Users/fairfieldt/.npm

export ANDROID_NDK=/usr/local/Cellar/android-ndk/r7c
export ANDROID_NDK_ROOT="$ANDROID_NDK"
export ANDROID_SDK=/usr/local/Cellar/android-sdk/r18
export CRYSTAX=/Users/fairfieldt/dev/android-ndk-r7-crystax-5.beta2 
export LEIN=/Users/fairfieldt/dev/leiningen
export CHECKER="$HOME/dev/checker"
export PATH=$CHECKER:$ANDROID_NDK:/usr/local/bin:$PATH:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:/Users/fairfieldt/node_modules/bin:/opt/local/bin:$LEIN

export GC="$HOME/dev/gameclosure"
export GCANDROID="$GC/android"
export GC_ANDROID_ROOT="$GCANDROID"
export GCSDKDIR="$GC/dev_sdk"
export SDKDIR="$ANDROID_SDK"
export NDKDIR="$ANDROID_NDK"



alias nb='`which ndk-build` -j9'
alias gc='cd ~/dev/gameclosure/'
alias c='clear'
alias ll='ls -lh'
alias la='ls -a'
alias cp='cp -v'
alias sdk-activate='. ~/dev/gameclosure/dev_sdk/gc_env/bin/activate'