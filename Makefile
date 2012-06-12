

install:
	ln -s .dotfiles/zshrc ../.zshrc
	ln -s .dotfiles/oh-my-zsh ../.oh-my-zsh
	ln -s ./.dotfiles/vimrc ../.vimrc
	ln -s ./.dotfiles/vimrc.before ../.vimrc.before
	ln -s ./.dotfiles/vimrc.after ../.vimrc.after
	ln -s ./.dotfiles/vim ../.vim
	chsh -s /bin/zsh
