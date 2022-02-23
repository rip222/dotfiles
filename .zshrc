# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

if [[ -e /usr/share/nvm/init-nvm.sh ]]; then
  source /usr/share/nvm/init-nvm.sh
fi

OVPN_CONFIG=~/file.ovpn
alias ovpn="sudo openvpn $OVPN_CONFIG"

if hash exa > /dev/null; then
  alias ls="exa --icons"
  alias ll="exa -l --icons"
  alias la="exa -a --icons"
  alias lla="exa -al --icons"
  alias lf="exa -abghHliS --icons"
fi

if hash nvim > /dev/null; then
  alias v=nvim
fi

if hash lvim > /dev/null; then
  alias lv=lvim
fi

GHISTORY="git log --oneline --all --graph"
if hash git > /dev/null; then
  alias gh=$GHISTORY
  alias gs="git status"
  alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
fi


