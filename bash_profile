# ~/.bash_profile: executed by bash(1) for login shells.

# source the users bashrc if it exists
# postpone this since we're planning on zsh
#if [ -f "${HOME}/.bashrc" ] ; then
#  source "${HOME}/.bashrc"
#fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# for tmux: new windows should open in the same location
export CHERE_INVOKING=1

# store our ssh credentials
eval $(ssh-agent)


### try launching tmux or zsh
#exec bash -c "tmux -u -2 new -A -s ezra || zsh || bash"

# check if we should tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux -u -2
fi

# source the users bashrc if it exists
# trying again since tmux failed
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi
