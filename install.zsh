#!/bin/zsh

dotfiles_path="$1"

rm -rf ~/.config/nvim
rm -rf ~/.config/starship

mkdir -p ~/.config/nvim
mkdir -p ~/.config/starship

ln -sf "$dotfiles_path/tmux/.tmux.conf" ~/.tmux.conf
ln -sf "$dotfiles_path/nvim" ~/.config/nvim
ln -sf "$dotfiles_path/zsh/.zshrc" ~/.zshrc
ln -sf "$dotfiles_path/starship/starship.toml" ~/.config/starship/starship.toml
