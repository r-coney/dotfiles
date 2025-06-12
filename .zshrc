PROMPT='
%F{cyan}[%n %#] %~
>>%f '

export PATH="$PATH:$HOME/.scripts"

# Git
export GIT_KEEP_BRANCHES='main,master,develop,release/*,hoge'

alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -lFG'
alias tailf='less -S +F'
alias d='docker'
alias dc='docker compose'
alias gittemp='less ~/.commit_template'
alias zshrc='vi ~/.zshrc'
alias brewfile='vi ~/.Brewfile'
alias dotfiles='cd ~/dotfiles'
alias vim='nvim'
alias vi='nvim'
alias scripts='ls -l ~/.scripts/'

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
