#!/bin/bash
if [ -f $(brew --prefix)/share/gitprompt.sh ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)"/opt/bash-git-prompt/share"
  . $(brew --prefix)/share/gitprompt.sh
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/etc/profile.d/z.sh ]; then
  . $(brew --prefix)/etc/profile.d/z.sh
fi

# Senstive functions which are not pushed to Github
if [ -f ~/.bash_private ]; then
  . ~/.bash_private
fi

# Get it from the original Git repo:
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# functions
## git
### shows differences of git branches
gdf() {
	echo 'Commits that exist in '$1' but not in '$2':'
	git log --graph --pretty=format:'%Cred%h%Creset %s' --abbrev-commit $2..$1
	echo 'Commits that exist in '$2' but not in '$1':'
	git log --graph --pretty=format:'%Cred%h%Creset %s' --abbrev-commit $1..$2
}

### git commit with 50 characters length check
gco() {
	len=${#1}
	if [ $len -gt 50 ]; then
		echo -n "Message length is $len, greater than 50, are you sure? (y/n): "
		read confirmation
		if [ $confirmation != 'y' ]; then
			return 0
		fi
	fi
	git commit -m "$1"
}
## unix
psgrep() {
    ps aux | awk 'NR == 1 || /'${1}'/'
}

### extracts the given file
x () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
# exports
export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:$GOBIN"

## colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#aliases
alias ls='ls -GpF'   # Mac OSX specific
alias ll='ls -alGpF' # Mac OSX specific

#completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous On" # show list automatically, without double tab
# bind "TAB: menu-complete" # TAB syle completion

# Ignore files with these suffixes when performing completion.
export FIGNORE='.o:.pyc'

# Ignore files that match these patterns when
# performing filename expansion.
export GLOBIGNORE='.DS_Store:*.o:*.pyc'

