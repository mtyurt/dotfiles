prmptcmd() { eval "$PROMPT_COMMAND" }

if [[ ! -n $TMUX ]]; then
else
    autoload colors && colors
        for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
            eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
            eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
        done
        eval RESET='%{$reset_color%}'
    function __prompt_command() {
        local EXIT="$?"             # This needs to be first
        PS1=""

        if [ $EXIT != 0 ]; then
            PS1+="${RED}%n"      # Add red if exit code non 0
        else
            PS1+="${GREEN}%n"
        fi

        PS1+=" $WHITE| $CYAN%T$RESET : "
        if [[ -d .git || `git rev-parse --git-dir 2> /dev/null` ]]; then
            # only show git directory path, omit the parents
            PS1+="${YELLOW}~~${PWD#*$(dirname `git rev-parse --show-toplevel`)/}"
        else
            PS1+="${YELLOW}%2c"

        fi
        PS1+="${BOLD_YELLOW} $ $RESET"
    }

    export PROMPT_COMMAND="__prompt_command;/Users/mt/.tmux-gitbar/update-gitbar"
    precmd_functions=(prmptcmd)
fi

