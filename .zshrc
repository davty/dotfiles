
export PATH="$PATH:$HOME/go/bin"


function mcd() {
  mkdir -p "$1" && cd "$1";
}

g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1
export VISUAL=vim
export EDITOR=$VISUAL

setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

export ERL_AFLAGS="-kernel shell_history enabled"

export HOMEBREW_NO_ANALYTICS=1

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
  fi
}

setopt promptsubst

# Allow exported PS1 variable to override default prompt.
PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

# load our own completion functions
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)

# completion; use cache if updated within 24h
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit -d $HOME/.zcompdump;
else
  compinit -C;
fi;

# disable zsh bundled function mtools command mcd
# which causes a conflict.
compdef -d mcd


# Unix
alias ll="ls -al"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"

# Bundler
alias p="python3"
alias manage="python3 manage.py"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'
