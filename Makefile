all:
	@echo "no command"

stow:
	@stow -S -v -t ${HOME} .

dry:
	@stow -n -v -t ${HOME} .

debug:
	@stow -vvv -n -t ${HOME} . | grep --color=always -z ${HOME}

install:
	@./scripts/manual_aur_install.sh paru-bin
	@sudo pacman -S zsh git stow fzf vim wl-clipboard xclip
	@mkdir -p ~/.config/nvim
	# @paru -S 