#!/bin/bash

packages=(
  "docker",
  "bitwarden",
  "virtualbox",
  "diff3",
  "calibre",
  "bleachbit",
  "discord",
  "telegram-desktop",
  "neovim",
  "yarn",
  "fzf",
  "jre-openjdk",
  "jdk-openjdk",
  "nvm",
  "rust-analyzer",
  "openvpn",
  "mono",
  "dotnet-host",
  "dotnet-runtime",
  "dotnet-sdk",
  "dotnet-targeting-pack",
  "wezterm",
  "gitui",
  "curl",
  "bottom",
  "xplr",
  "bandwhich",
  "youtube-dl",
  "monero-gui",
  "xmrig-bin",
)

aur_packages=(
  "google-chrome",
  "spotify",
  "upwork",
  "visual-studio-code-bin",
  "rider",
  "xflux",
  "fnm-bin",
  "typescript-language-server",
)

npm_packages=(
  "@angular/cli",
  "typescript",
)

cargo_packages=(
  "cargo-edit",
)

# Install yay
git clone https://aur.archlinux.org/yay-git.git yay
cd yay
sudo pacman -S --needed base-devel git
makepkg -si


# JET BRAINS MONO FONT with ligatures
curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh | sh

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

for pkg in packages 
do
  sudo pamac install $pkg --no-confirm
done

for pkg in "${aur_packages[@]}"
do
  sudo yay -S $pkg
done

for pkg in "${npm_packages[@]}"
do
  sudo npm i -g $pkg
done

for pkg in "${cargo_packages[@]}"
do
  sudo cargo install $pkg
done


