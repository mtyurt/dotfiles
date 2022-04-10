# Keep it simple for now...
all:
	mkdir -p ~/.config/alacritty

	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -d ~/.config/nvim ] || ln -s $(PWD)/nvim ~/.config/nvim
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml

	# [ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -d ~/.oh-my-zsh/custom/plugins/warhol ] || git clone https://github.com/unixorn/warhol.plugin.zsh.git ~/.dotfiles/zsh-custom/plugins/warhol
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.Brewfile ] || ln -s $(PWD)/Brewfile ~/.Brewfile
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmuxconf ~/.tmux.conf
	[ -d ~/.tmux-gitbar ] || git clone git://git@github.com/mtyurt/tmux-gitbar.git ~/.tmux-gitbar
	[ -f ~/.tmux-gitbar.conf ] || ln -s $(PWD)/tmux-gitbar.conf ~/.tmux-gitbar.conf

clean:
	[ -f ~/.vimrc ] || rm ~/.vimrc
	rm -f ~/.config/alacritty/alacritty.yml


.PHONY: all
