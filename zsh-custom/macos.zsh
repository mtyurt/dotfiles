
# flush DNS, restart wifi
dnsflush(){
    sudo ifconfig en0 down
    sudo route flush
    sudo ifconfig en0 up
}

# sleep after x seconds
sleepafter() {
    sleep $*
    pmset sleepnow

}

# ls
##set LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx
#unset LSCOLORS
#export CLICOLOR=1
#export CLICOLOR_FORCE=1
# alias ls='ls -GpF'   # Mac OSX specific
alias ll="/usr/local/bin/ls_extended -hsla" # Mac OSX specific

# other
alias preview='open -a Preview'
