# NOTE: Make sure to create a symlink from ~/.zshrc to here

# Path to the Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Syntax highlighting must be last for best performance
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Allow autosuggestion to show tab-completion, falling back to history
export ZSH_AUTOSUGGEST_STRATEGY=(
    history
    completion
)

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
