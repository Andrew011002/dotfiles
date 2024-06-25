export STARSHIP_CONFIG=~/.config/starship/starship.toml
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_*[!.pub]
fi
eval "$(starship init zsh)"
