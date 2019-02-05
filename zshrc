# Don't complain when there are no files to chmod
setopt null_glob

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
source $HOME/.zsh/prompt.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt histverify
setopt autocd
unsetopt beep
# End of lines configured by zsh-newuser-install

# load any local settings
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
