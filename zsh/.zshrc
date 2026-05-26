# Set editor
export EDITOR="code -w"

# Compilation flags
export ARCHFLAGS="-arch arm64"

# Set XDG directories
export XDG_CONFIG_HOME="$HOME/.config"

# Add custom scripts to PATH
export PATH="$HOME/.config/scripts:$PATH"

# Add local bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Antidote
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# fzf completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zsh completion
autoload -Uz compinit
compinit

# Carapace completion library configuration (keep this straight after compinit)
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
export CARAPACE_MATCH=1
source <(carapace _carapace)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'

# Smart history: Up/Down arrows search history by current input
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Quality of life
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

bindkey " " magic-space # To undo key binding for space, remove this line and run `bindkey " " self-insert` in terminal

# chpwd hooks that run on directory change
autoload -Uz add-zsh-hook

# Auto-activate Python virtual environments
function auto_venv() {
  # If already in a virtualenv, do nothing
  if [[ -n "$VIRTUAL_ENV" && "$PWD" != ${VIRTUAL_ENV:h}* ]]; then
    deactivate
    return  
  fi

  [[ -n "$VIRTUAL_ENV" ]] && return

  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/.venv/bin/activate" ]]; then
      source "$dir/.venv/bin/activate"
      return
    fi
    dir="${dir:h}"
  done
}

auto_venv # Run on startup
add-zsh-hook chpwd auto_venv

# Mise
eval "$(mise activate zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Starship (should be at the end)
eval "$(starship init zsh)"
