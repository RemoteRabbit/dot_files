# Plugin for not needing to use cd and better tab completion
setopt  autocd autopushd
autoload -U compinit
compinit

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

export EDITOR='nvim'

alias vim="nvim"
alias tmf="tmuxifier"
alias tmfl="tmuxifier load-session "
alias rm="trash -v"
alias cat="bat"

eval "$(starship init zsh)"

# Add vim bindings to shell
source $HOME/dot_files/zsh/shell-plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Plugin for auto suggestions
source $HOME/dot_files/zsh/shell-plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Plugin for syntax highlighting
source $HOME/dot_files/zsh/shell-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

neofetch
