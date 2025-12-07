# History
HISTFILE=~/.histfile
HISTSIZE=65535
SAVEHIST=65535

# Completion
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Safe pasting and auto-quoting
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Plugins
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=completion

source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Keybinds
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^[[1;5A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down

# Functions
mkcd() { mkdir "$1" && cd "$1" }
mvcd() { mv "$1" "$2" && cd "$2" }
# v() {
#     kitty @ load-config ~/.config/kitty/themes/catppuccin.conf
#     nvim "$@"
#     kitty @ load-config ~/.config/kitty/kitty.conf
# }

# Aliases
alias v='nvim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias h='cd ~'
alias ls='eza --git --icons=always'
alias cat='bat'
alias mk='mkdir'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias ff='clear && fastfetch'
alias py='python'

# Prompt
autoload -Uz vcs_info
function precmd { vcs_info }
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '  %b '
zstyle ':vcs_info:*' actionformats '  %b (%a) '
setopt prompt_subst
PROMPT='${vcs_info_msg_0_}%(?..%F{9}%B[%?]%b%f )%F{14}%n%f@%F{14}%m%f %~ $ '
