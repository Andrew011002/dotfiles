#!/bin/zsh

# Ensure the provided directory is valid and exists
dotfiles_dir="$1"
if [[ ! -d "$dotfiles_dir" || ! "$dotfiles_dir" =~ \.dotfiles$ ]]; then
  echo "Please provide the path to your .dotfiles directory."
  exit 1
fi

# Files to link directly in the home directory
home_files=(.gitconfig .zshrc)

# Directories to link inside ~/.config
config_dirs=(nvim tmux starship)

# Ensure the ~/.config directory exists
mkdir -p "$HOME/.config"

# Function to link files to the home directory
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

# Function to conditionally link .warp based on OS
link_warp() {
  local source="$dotfiles_dir/.warp"

  # Check if the source exists
  if [ ! -e "$source" ]; then
    echo "Source $source does not exist. Skipping..."
    return
  fi

  if [[ "$(uname)" == "Linux" ]]; then
    local target="${XDG_DATA_HOME:-$HOME/.local/share}/warp-terminal"
    mkdir -p "$target"
    target+="/.warp"  # Target file within the directory
  elif [[ "$(uname)" == "Darwin" ]]; then
    local target="$HOME/.warp"
  else
    echo "Unsupported OS."
    return
  fi

  # Remove existing target if it exists
  [ -e "$target" ] || [ -L "$target" ] && rm -rf "$target"

  # Create the new symlink
  ln -s "$source" "$target"
  echo "Linked $source to $target"
}

# Execute linking functions
link_to_home
link_to_config
link_warp  # Call the new function to handle .warp content

echo "All specified dotfiles have been linked successfully."

