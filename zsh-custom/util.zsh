## unix
cheat(){
    curl cht.sh/$1
}

## done
d(){
    echo "$(date) $*" >> done.txt
}

#aliases
eval $(thefuck --alias f)
