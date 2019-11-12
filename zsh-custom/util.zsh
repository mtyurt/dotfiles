## unix
cheat(){
    curl cht.sh/$1
}

## done
d(){
    echo "$*" >> done.txt
}

#aliases
eval $(thefuck --alias f)
