

install:
	ln -s .dotfiles/zshrc ../.zshrc
	ln -s .dotfiles/oh-my-zsh ../.oh-my-zsh
	ln -s ./.dotfiles/vimrc ../.vimrc
	ln -s ./.dotfiles/vim ../.vim
	chsh -s /bin/zsh
