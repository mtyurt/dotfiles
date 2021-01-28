export ZSH="/Users/mt/.oh-my-zsh"

ZSH_THEME="robbyrussell"

### BEGIN --- OHMYZSH setup
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# ALL FUNCTIONS & ALIASES ARE LOCATED UNDER HERE
ZSH_CUSTOM=~/.dotfiles/zsh-custom

plugins=(profiles git web-search tmux jira git-prompt colored-man-pages dotenv docker warhol zsh-completions zsh-autosuggestions)
plugins+=(docker-machine)

source $ZSH/oh-my-zsh.sh
fpath=(~/.dotfiles/zsh-custom/autocomplete/ $fpath)

### END --- OHMYZSH setup

autoload -U compinit && compinit

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/usr/local/opt/node@10/bin:/usr/local/opt/postgresql@11/bin: /usr/local/opt/python@3.9/libexec/bin"
export HIST_STAMPS='%d/%m/%y %T '

# Senstive functions which are not pushed to Github
if [ -f ~/.bash_private ]; then
  . ~/.bash_private
fi

# z navigation
. /usr/local/etc/profile.d/z.sh

# of course
export EDITOR=vim

export HOSTFILE=$HOME/.hosts

export DYLD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH

if [ ! "$TMUX" = "" ]; then export TERM=xterm-256color; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
