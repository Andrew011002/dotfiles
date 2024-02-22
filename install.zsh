#!/bin/zsh

# Ensure the provided directory is valid and exists
dotfiles_dir="$1"
if [[ ! -d "$dotfiles_dir" || ! "$dotfiles_dir" =~ \.dotfiles$ ]]; then
  echo "Please provide the path to your .dotfiles directory."
  exit 1
fi

# Files and directories to link directly in the home directory
home_files=(.gitconfig .zshrc .warp)

# Directories to link inside ~/.config
config_dirs=(nvim tmux starship)

# Ensure the ~/.config directory exists
mkdir -p "$HOME/.config"

# Function to link files and directories to the home directory
link_to_home() {
  for item in "${home_files[@]}"; do
    local target="$HOME/$item"
    local source="$dotfiles_dir/$item"

    # Check if the source exists
    if [ ! -e "$source" ]; then
      echo "Source $source does not exist. Skipping..."
      continue
    fi

    # Remove existing target if it exists
    [ -e "$target" ] || [ -L "$target" ] && rm -rf "$target"

    # Create the new symlink
    ln -s "$source" "$target"
    echo "Linked $source to $target"
  done
}

# Function to link directories to ~/.config
link_to_config() {
  for dir in "${config_dirs[@]}"; do
    local target="$HOME/.config/$dir"
    local source="$dotfiles_dir/$dir"

    # Check if the source exists
    if [ ! -e "$source" ]; then
      echo "Source $source does not exist. Skipping..."
      continue
    fi

    # Remove existing target if it exists
    [ -e "$target" ] || [ -L "$target" ] && rm -rf "$target"

    # Create the new symlink
    ln -s "$source" "$target"
    echo "Linked $source to $target"
  done
}

# Execute linking functions
link_to_home
link_to_config

echo "All specified dotfiles have been linked successfully."

