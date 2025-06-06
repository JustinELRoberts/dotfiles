# NOTE: Make sure to create a symlink from ~/.zshrc to here

# Path to the Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Syntax highlighting must be last for best performance
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
)

# Allow autosuggestion to show history-based completion, falling back to tab-completion
export ZSH_AUTOSUGGEST_STRATEGY=(
    history
    completion
)

function vi_mode_overrides() {
  # Use Ctrl-P and Ctrl-N to go backwards and forwards in the autosuggestions
  bindkey "^P" history-beginning-search-backward
  bindkey "^N" history-beginning-search-forward
}

zvm_after_init_commands+=(vi_mode_overrides)

# Use oh my zsh
source $ZSH/oh-my-zsh.sh

# Include aliases
source ~/.config/zsh/.aliases

# Include LS_COLORS
source ~/.config/lsd/.lscolors

# Initialize starship
eval "$(starship init zsh)"

# Include starship in custom dir
source ~/.config/starship/.starship
