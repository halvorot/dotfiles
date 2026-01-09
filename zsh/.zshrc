# Set editor
export EDITOR="code -w"

# Compilation flags
export ARCHFLAGS="-arch arm64"

# scripts
export PATH="$HOME/.config/scripts:$PATH"

# Antidote
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

# fzf completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zsh completion
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select
compinit

# Smart history: Up/Down arrows search history by current input
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Quality of life
setopt HIST_IGNORE_DUPS SHARE_HISTORY
bindkey -e

bindkey " " magic-space # To undo key binding for space, remove this line and run `bindkey " " self-insert` in terminal

# chpwd hooks that run on directory change
autoload -Uz add-zsh-hook

# Auto-activate Python virtual environments
function auto_venv() {
  # If already in a virtualenv, do nothing
  if [[ -n "$VIRTUAL_ENV" && "$PWD" != *"${VIRTUAL_ENV:h}"* ]]; then
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
# Auto-use correct Node version with nvm
function auto_nvm() {
  [[ -f .nvmrc ]] && nvm use
}

add-zsh-hook chpwd auto_venv
add-zsh-hook chpwd auto_nvm

# uv completions
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# bun completions
[ -s "/Users/halvor/.bun/_bun" ] && source "/Users/halvor/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Java
export JAVA_HOME="$(brew --prefix openjdk@21)/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# Starship (should be at the end)
eval "$(starship init zsh)"export PATH="$HOME/.local/bin:$PATH"
