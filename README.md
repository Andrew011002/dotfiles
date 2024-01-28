# Dotfiles

This repository contains my personal dotfiles for setting up my development environment, which includes configurations for Neovim, Tmux, Zsh with Oh My Zsh, Powerlevel10k, and Git.

## Dependencies

Before installing the dotfiles, ensure the following dependencies are installed on your system.

### On macOS (using Brew):

```
brew install neovim
brew install tmux
brew install zsh
```

### On Ubuntu (using apt):
```bash
sudo apt update
sudo apt install neovim
sudo apt install tmux
sudo apt install zsh
```

### To install Oh My Zsh:
```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### To install Powerlevel10k for Oh My Zsh:
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

## Installation

1. Clone the repository to your home directory:

```bash
cd ~
git clone https://github.com/Andrew011002/dotfiles.git
```

2. Create symbolic links for the dotfiles:
```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -s ~/dotfiles/nvim ~/.config/nvim
mkdir -p ~/.config/tmux && ln -s ~/dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
```

3. Source your `.zshrc` to apply the changes:
```bash
source ~/.zshrc
```
