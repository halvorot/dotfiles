# Set editor
export EDITOR="code -w"

# Compilation flags
export ARCHFLAGS="-arch arm64"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

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

# bun completions
[ -s "/Users/halvor/.bun/_bun" ] && source "/Users/halvor/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Starship (should be at the end)
eval "$(starship init zsh)"export PATH="$HOME/.local/bin:$PATH"
