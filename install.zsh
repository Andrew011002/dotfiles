#!/bin/zsh

dotfiles_path="$1"

mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/starship

[ -L ~/.config/nvim ] && rm ~/.config/nvim
[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim

ln -sf "$dotfiles_path/nvim" ~/.config/nvim
ln -sf "$dotfiles_path/tmux/.tmux.conf" ~/.tmux.conf
ln -sf "$dotfiles_path/zsh/.zshrc" ~/.zshrc
ln -sf "$dotfiles_path/starship/starship.toml" ~/.config/starship/starship.toml
