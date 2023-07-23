set fish_greeting
set -x LANG en_US.UTF-8

alias ls=exa
alias cat=ccat
alias vi=vim
alias v=nvim
alias bt='set RUST_BACKTRACE 1 && echo "RUST_BACKTRACE=1"'
alias ubt='set -e RUST_BACKTRACE && echo "Unset RUST_BACKTRACE"'
alias l='exa -lahF --icons'

set __fish_git_prompt_color_branch magenta bold
set __fish_git_prompt_hide_untrackedfiles 1
set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_showupstream "informative"
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_dirtystate blue
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_untrackedfiles $fish_color_normal
set __fish_git_prompt_color_cleanstate green

set __fish_git_prompt_char_dirtystate 'DTY'
set __fish_git_prompt_char_stagedstate 'STG'
set __fish_git_prompt_char_untrackedfiles 'NTRK'
set -g __fish_git_prompt_char_conflictedstate "CNFLT"
set -g __fish_git_prompt_char_cleanstate "CLN"

set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'
