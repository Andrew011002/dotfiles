#!/bin/zsh
dotfiles_path="$1"

# Create necessary directories
mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/starship

# Remove existing nvim configurations
[ -L ~/.config/nvim ] && rm ~/.config/nvim
[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim

# Remove existing starship configurations
[ -L ~/.config/starship ] && rm ~/.config/starship
[ -d ~/.config/starship ] && rm -rf ~/.config/starship
[ -d ~/.cache/starship ] && rm -rf ~/.cache/starship

# Create symbolic links
ln -sf "$dotfiles_path/nvim" ~/.config/nvim
ln -sf "$dotfiles_path/tmux/.tmux.conf" ~/.tmux.conf
ln -sf "$dotfiles_path/zsh/.zshrc" ~/.zshrc
ln -sf "$dotfiles_path/starship" ~/.config/starship
