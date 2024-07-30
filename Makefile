all:
	@echo "no command"

stow:
	@stow -S -v -t ${HOME} .

simulate:
	@stow -n -v -t ${HOME} .

debug:
	@stow -vvv -n -t ${HOME} . | grep --color=always -z ${HOME}

install:
	@pacman -S zsh git stow fzf vim
	# @paru -S 