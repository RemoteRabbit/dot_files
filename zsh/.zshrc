# Used to check optimization
zmodload zsh/zprof
zmodload zsh/datetime
setopt promptsubst
PS4='+$EPOCHREALTIME %N:%i> '
exec 3>&2 2> $ZDOTDIR/stats/startlog.$$
setopt xtrace prompt_subst
# -----------------------------------------

source $ZDOTDIR/aliases

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

eval "$(starship init zsh)"

# Plugin for auto suggestions
source $ZDOTDIR/shell-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Add vim bindings to shell
# commented out as this prevents other plugins from working
# source $ZDOTDIR/shell-plugins/zsh-vi-mode/zsh-vi-mode.zsh

# Plugin for syntax highlighting
source $ZDOTDIR/shell-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Tmux start or attach
if [ ! "$TMUX" ]; then
  tmux attach -t core || tmux new -s core
fi

pfetch

# Used to check optimization
unsetopt xtrace
exec 2>&3 3>&-
zprof > $ZDOTDIR/stats/zprof-stats
