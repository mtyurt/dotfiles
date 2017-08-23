# Keep it simple for now...
all:
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.Brewfile ] || ln -s $(PWD)/Brewfile ~/.Brewfile
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig

clean:
	[ -f ~/.vimrc ] || rm ~/.vimrc

.PHONY: all
