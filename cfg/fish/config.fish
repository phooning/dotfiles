set fish_greeting

alias ls=exa
alias cat=ccat
alias vi=vim
alias v=nvim
alias bt='set RUST_BACKTRACE 1 && echo "RUST_BACKTRACE=1"'
alias ubt='set -e RUST_BACKTRACE && echo "Unset RUST_BACKTRACE"'
alias l='exa -lahF --icons'

fish_add_path /opt/homebrew/sbin

# PostgreSQL for M1
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
fish_add_path /opt/homebrew/opt/openjdk/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

