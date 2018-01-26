# Keep it simple for now...
all:
	mkdir -p ~/.config/alacritty

	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml

	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.Brewfile ] || ln -s $(PWD)/Brewfile ~/.Brewfile
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmuxconf ~/.tmux.conf

clean:
	[ -f ~/.vimrc ] || rm ~/.vimrc
	rm -f ~/.config/alacritty/alacritty.yml


.PHONY: all
