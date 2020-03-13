setopt promptsubst

function precmd {
    psvar=()

    vcs_info
    [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}

# Mode indicator for vi bindings
local VI_INSERT='•'
local VI_NORMAL='Δ'
local VI_INSERT_COLOR='yellow'
local VI_NORMAL_COLOR='red'
local VI_MODE=$VI_INSERT
local VI_COLOR=$VI_INSERT_COLOR
local VI_PROMPT="%{$fg[${VI_COLOR}]%}${VI_MODE}%{$reset_color%}"

function zle-keymap-select zle-line-init {
  VI_MODE="${${KEYMAP/vicmd/$VI_NORMAL}/(main|viins)/$VI_INSERT}"
  VI_COLOR="${${KEYMAP/vicmd/$VI_NORMAL_COLOR}/(main|viins)/$VI_INSERT_COLOR}"
  VI_PROMPT="%{$fg[${VI_COLOR}]%}${VI_MODE}%{$reset_color%}"
  zle reset-prompt
}

function zle-line-finish {
  VI_MODE=$VI_INSERT
  VI_COLOR=$VI_INSERT_COLOR
  VI_PROMPT="%{$fg[${VI_COLOR}]%}${VI_MODE}%{$reset_color%}"
}

local EXIT_CODE_MARK="%(?,%{$fg[green]%}+%{$reset_color%},%{$fg[red]%}-%{$reset_color%})"

zle -N zle-keymap-select
zle -N zle-line-finish
zstyle ':vcs_info:cvsfix:*' formats "cvs-[%b]"

PROMPT='%{$fg[cyan]%}%m:%{$reset_color%}%{$fg[green]%}%~%{$reset_color%} %{$fg[blue]%}%1v%{$reset_color%}
${EXIT_CODE_MARK} '

RPROMPT=''

