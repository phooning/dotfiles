set fish_greeting

alias ls=exa
alias cat=ccat
alias vi=vim
alias v=nvim
alias m='cd /Users/david/toc/inet/music && ls -lah'
alias base='cd ~/toc && ls -lah'
alias bt='set RUST_BACKTRACE 1 && echo "RUST_BACKTRACE=1"'
alias ubt='set -e RUST_BACKTRACE && echo "Unset RUST_BACKTRACE"'
alias map='nvim ~/toc/tacmap.txt'

fish_add_path /opt/homebrew/sbin

# PostgreSQL for M1
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
