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
 
if ! type nvm &>/dev/null  
then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  echo "nvm is installed"
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


if ! type yadm &>/dev/null  
then
  brew install yadm
  echo "yadm is installed"
  yadm clone -f git@github.com:rip222/dotfiles.git
  echo "dotfiles are copied"
fi
 
