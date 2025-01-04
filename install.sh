#!/bin/bash
if ! type brew &>/dev/null  
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "brew is installed"
  (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> ~/.profile
  eval "$(/usr/local/bin/brew shellenv)"
fi

if ! type stow &>/dev/null  
then
  brew install stow

  git clone git@github.com:rip222/dotfiles.git 

  cd dotfiles

  stow .
fi


if ! command -v nix 2>&1 >/dev/null
then
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

  nix run nix-darwin -- switch --flake ~/dotfiles/nix-darwin
fi

darwin-rebuild switch --flake ~/dotfiles/nix-darwin
