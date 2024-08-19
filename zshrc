export PATH="/opt/homebrew/bin:/opt/homebrew/opt/python@3.11/Frameworks/Python.framework/Versions/3.11/bin:/Users/mt/Library/Python/3.11/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/dev/go/bin:/usr/local/opt/postgresql@11/bin:/usr/local/opt/openjdk@11/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

ZSH_CUSTOM=~/.dotfiles/zsh-custom

plugins=(
  profiles
  git
  git-prompt
  tmux
  colored-man-pages
  dotenv
  docker
  zsh-completions
  zsh-autosuggestions
  zsh-tmux-auto-title
)
fpath=(~/.dotfiles/zsh-custom/autocomplete/ $fpath)

source $ZSH/oh-my-zsh.sh
fpath=(~/.dotfiles/zsh-custom/autocomplete/ $fpath)

# User configuration

autoload -U compinit && compinit

export HIST_STAMPS='%d/%m/%y %T '

# Senstive functions which are not pushed to Github
if [ -f ~/.bash_private ]; then
  . ~/.bash_private
fi

# z navigation
. /opt/homebrew/etc/profile.d/z.sh

# of course
export EDITOR=nvim

if [ ! "$TMUX" = "" ]; then export TERM=xterm-256color; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

 [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#
compdef __start_kubectl k
source <(kubectl completion zsh)

alias vim=nvim
alias vimdiff=nvimdiff

export JAVA_HOME=/opt/homebrew/Cellar/openjdk@17/17.0.10/libexec/openjdk.jdk/Contents/Home


alias bat="bat --theme gruvbox-dark"
alias nvimdiff="nvim -d"
alias rgi="rg --ignore-case"
eval "$(gh copilot alias -- zsh)"
