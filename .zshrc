if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSHZ_CMD="cd"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git virtualenv zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
