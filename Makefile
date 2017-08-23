# Keep it simple for now...
all:
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.ctags ] || ln -s $(PWD)/ctags ~/.ctags
	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.Brewfile ] || ln -s $(PWD)/Brewfile ~/.Brewfile
	[ -f ~/.git-prompt.sh ] || ln -s $(PWD)/git-prompt.sh ~/.git-prompt.sh

clean:
	[ -f ~/.vimrc ] || rm ~/.vimrc
	[ -f ~/.ctags ] || rm ~/.ctags

.PHONY: all
