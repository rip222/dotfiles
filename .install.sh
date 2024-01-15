if ! type brew &>/dev/null  
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install zsh-syntax-highlighting
  brew install zsh-history-substring-search
  brew install zsh-autosuggestions
  echo "brew is installed"
fi
 
if ! type git &>/dev/null  
then
  brew install git
  echo "git is installed"
fi

# Install oh my zsh
if ! type omz &>/dev/null  
then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  rm .zshrc
  echo "oh my zsh is installed"
fi
 
if ! type go &>/dev/null
then
  brew install golang
  echo "go is installed"
fi
 
if ! type wezterm &>/dev/null
then
  brew install wezterm
  echo "wezterm is installed"
fi
 
# Install exa and set aliases
if ! type exa &>/dev/null  
then
  brew install exa
  echo "exa is installed"
fi
 
 
if ! type nvim &>/dev/null  
then
  brew install nvim
  echo "nvim is installed"
else
  alias v=nvim
fi
 
if ! type codium &>/dev/null  
then
  brew install vscodium
  echo "vscodium is installed"
fi
 
if ! type rg &>/dev/null  
then
  brew install ripgrep
  echo "ripgrep is installed"
fi
 
if ! type rustc &>/dev/null  
then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "rust is installed"
fi

if ! type gitui &>/dev/null  
then
  brew install gitui
  echo "gitui is installed"
fi

if ! type volta &>/dev/null  
then
  brew install volta
  echo "volta is installed"
  echo "More info: https://github.com/volta-cli/volta"
fi

if ! type delta &>/dev/null  
then
  brew install git-delta
  echo "delta is installed"
  echo "More info: https://github.com/dandavison/delta"
fi


if ! type broot &>/dev/null  
then
  brew install broot
  echo "broot is installed"
  echo "More info: https://github.com/Canop/broot"
fi

if ! type bat &>/dev/null  
then
  brew install bat
  echo "bat is installed"
  echo "More info: https://github.com/sharkdp/bat"
fi

if ! type btm &>/dev/null  
then
  brew install bottom
  echo "bottom is installed"
  echo "More info: https://github.com/ClementTsang/bottom"
fi

if ! type fd &>/dev/null  
then
  brew install fd
  echo "fd is installed"
  echo "More info: https://github.com/sharkdp/fd"
fi

if ! type sd &>/dev/null  
then
  brew install sd
  echo "sd is installed"
  echo "More info: https://github.com/chmln/sd"
fi

if ! type starship &>/dev/null  
then
  brew install starship
  echo "starship is installed"
  echo "More info: https://github.com/starship/starship"
fi

if ! type zellij &>/dev/null  
then
  brew install zellij
  echo "zellij is installed"
  echo "More info: https://github.com/zellij-org/zellij"
fi

if ! type kondo &>/dev/null  
then
  brew install kondo
  echo "kondo is installed"
  echo "More info: https://github.com/tbillington/kondo"
fi

if ! type tokei &>/dev/null  
then
  brew install tokei
  echo "tokei is installed"
  echo "More info: https://github.com/XAMPPRocky/tokei"
fi

if ! type zoxide &>/dev/null  
then
  cargo install --git https://github.com/ajeetdsouza/zoxide
  echo "zoxide is installed"
  echo "More info: https://github.com/ajeetdsouza/zoxide"
fi

if ! type yadm &>/dev/null  
then
  brew install yadm
  echo "yadm is installed"
  yadm clone -f git@github.com:rip222/dotfiles.git
  echo "dotfiles are copied"
fi
 
