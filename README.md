# dotfiles
shell configuration files for ezra's linux setup, e.g. via WSL

usage e.g.:
* sudo apt install git
* git clone [this-repo]
* sudo apt install $(cat dotfiles/apt.list)
* dotfiles/deploy
* cp dotfiles/tmux.conf.local ~/.tmux.conf.local

installing extra packages:
* sudo apt install $(cat dotfiles/extra.apt.list)
* pip3 install --user --requirement extra.requirements.pip3.txt
