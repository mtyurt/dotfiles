## colored less  - requires pip install pygments
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# Ignore files with these suffixes when performing completion.
export FIGNORE='.o:.pyc'

# Ignore files that match these patterns when
# performing filename expansion.
export GLOBIGNORE='.DS_Store:*.o:*.pyc'


psgrep () {
    ps aux | awk 'NR == 1 || /'${1}'/'
}

# extracts the given file
x () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.xz)    tar xzf $1     ;;
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

# Move back up the directory tree to the first directory matching the name
# https://sanctum.geek.nz/cgit/dotfiles.git/tree/sh/shrc.d/bd.sh
bd() {

    # Check arguments; default to ".."
    if [ "$#" -gt 1 ] ; then
        printf >&2 'bd(): Too many arguments\n'
        return 2
    fi
    set -- "${1:-..}"

    # Look at argument given; default to going up one level
    case $1 in

        # If it's slash, dot, or dot-dot, we'll just go there, like `cd` would
        /|.|..) ;;

        # Anything else with a slash anywhere is an error
        */*)
            printf >&2 'bd(): Illegal slash\n'
            return 2
            ;;

        # Otherwise, add and keep chopping at the current directory until it's
        # empty or it matches the request, then shift the request off
        *)
            set -- "$1" "$PWD"
            while : ; do
                case $2 in
                    */"$1"|'') break ;;
                    */) set -- "$1" "${2%/}" ;;
                    */*) set -- "$1" "${2%/*}" ;;
                    *) set -- "$1" '' ;;
                esac
            done
            shift
            ;;
    esac

    # If we have nothing to change into, there's an error
    if [ -z "$1" ] ; then
        printf >&2 'bd(): No match\n'
        return 1
    fi

    # We have a match; try and change into it
    cd -- "$1"
}

# Change directory to .git root directory above
cdg() {
    cd $(git rev-parse --show-toplevel)
}

# Create a directory and change into it
# https://sanctum.geek.nz/cgit/dotfiles.git/tree/sh/shrc.d/mkcd.sh
mkcd() {
    mkdir -p -- "$1" && cd -- "$1"
}

# Find and replace in current directory
find-and() {
    printf "replace: ${GREEN}find . -exec sed -i '' -e 's#${ORANGE}pattern${NC}${GREEN}#${ORANGE}replaceto${NC}${GREEN}#g'${NC}\n"
    printf "delete: ${GREEN}find . -exec sed -i '' -e '/${ORANGE}pattern${GREEN}/d'${NC}\n"
}

# ag with less colorful
agl(){
    ag $1 --color | less
}

# aliases
alias grep='grep --color=auto'
