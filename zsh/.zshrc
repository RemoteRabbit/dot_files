# Used to check optimization
zmodload zsh/zprof
zmodload zsh/datetime
setopt promptsubst
PS4='+$EPOCHREALTIME %N:%i> '
exec 3>&2 2> $ZDOTDIR/stats/startlog.$$
setopt xtrace prompt_subst
# -----------------------------------------
# Tmux start or attach
if [ ! "$TMUX" ]; then
  tmux new-session -s dots -d -c $HOME/dot_files
  tmux attach -t home || tmux new-session -s home -c $HOME
fi

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

# Plugins
source $ZDOTDIR/shell-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/shell-plugins/zsh-vi-mode/zsh-vi-mode.zsh
source $ZDOTDIR/shell-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/shell-scripts/search.zsh

# Exports
export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

pfetch

# Used to check optimization
unsetopt xtrace
exec 2>&3 3>&-
zprof > $ZDOTDIR/stats/zprof-stats
