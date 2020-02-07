# Function handling
fpath=(~/.zsh/funcs $fpath)
autoload -Uz reload

# Colors
autoload -U colors
colors

# home, end, del
# https://bbs.archlinux.org/viewtopic.php?id=26110
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "\e[3~" delete-char

# vi settings
# bindkey -v
# KEYTIMEOUT=1
 
# VCS
autoload -Uz vcs_info
autoload -Uz VCS_INFO_detect_cvsfix
autoload -Uz VCS_INFO_get_data_cvsfix

# Prompt stuff from zshcontrib
autoload -U promptinit && promptinit
source "$HOME/.zsh/prompt.zsh"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt histverify
setopt autocd
unsetopt beep
# End of lines configured by zsh-newuser-install

setopt appendhistory nomatch histignoredups
unsetopt null_glob
bindkey -e

# use vim for e.g. cvs commits
export EDITOR=vim

# open Firefox from WSL
#export BROWSER='/mnt/c/Program Files/Mozilla Firefox/firefox.exe'

## miniconda lazy loading
## miniconda is slow
#function conda() {
#    # >>> conda initialize >>>
#    # !! Contents within this block are managed by 'conda init' !!
#    __conda_setup="$('/home/ezrab/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#    if [ $? -eq 0 ]; then
#        eval "$__conda_setup"
#    else
#        if [ -f "/home/ezrab/miniconda3/etc/profile.d/conda.sh" ]; then
#            . "/home/ezrab/miniconda3/etc/profile.d/conda.sh"
#        else
#            export PATH="/home/ezrab/miniconda3/bin:$PATH"
#        fi
#    fi
#    unset __conda_setup
#    # <<< conda initialize <<<
#    
#    conda "$@"
#}

# compinit is slow
# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle :compinstall filename "$HOME/.zshrc.local"

autoload -Uz compinit
compinit -d "$HOME/.zcompdump"
# End of lines added by compinstall

# fish-style syntax highlighting (prefers to be last)
# yep it's slow too
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# load any aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi
# load any local settings
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
