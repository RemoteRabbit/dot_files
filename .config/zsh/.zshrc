# Add vim bindings to shell
source $HOME/dot_files/.config/zsh/shell-plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git colored-man-pages zsh-syntax-highlighting zsh-autosuggestions git git-prompt virtualenv colorize)

export EDITOR='nvim'

export TMUXIFIER_LAYOUT_PATH=$HOME/dot_files/tmux/tmux-layouts

export KITTY_CONFIG_DIRECTORY=$HOME/kitty/kitty.conf
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias python="python3"
alias vim="nvim"
alias tmf="tmuxifier"
alias tmfl="tmuxifier load-session "
alias rm="trash -v"

# Pomodoro timer from (https://gist.github.com/bashbunni/3880e4194e3f800c4c494de286ebc1d7)
declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"

#source <(kubectl completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `pipx` on 2022-11-11 18:42:38
export PATH="$PATH:/Users/tristanjahnke/.local/bin"
export PATH="$PATH:/Users/tristanjahnke/tmux-spotify-info"
export PATH="$HOME/.tmuxifier/bin:$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init zsh)"
