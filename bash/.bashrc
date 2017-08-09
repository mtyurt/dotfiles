if [ -f /usr/local/share/gitprompt.sh ]; then
	GIT_PROMPT_SHOW_UPSTREAM=1
	#GIT_PROMPT_ONLY_IN_REPO=1
	. /usr/local/share/gitprompt.sh
fi

# custom
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
