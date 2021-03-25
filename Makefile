default: run
help:
		@echo 'Management commands for dotfiles:'
		@echo
		@echo 'Usage:'
		@echo ''
		@echo '		Author													Jonathan Bartlett <jonathan@jonnobrow.co.uk>'
		@echo

install-chezmoi:
		@echo 'Installing chezmoi.'
		bash ./scripts/install-chezmoi.sh

chezmoi-init:
		@echo 'Initializing chezmoi.'
		chezmoi init -S ${CURDIR} -v

chezmoi-apply:
		@echo 'Apply chezmoi.'
		chezmoi apply -v

ensure-directories:
		@echo 'Ensuring key directories exist.'
		bash ./scripts/ensure-directories.sh

install-deps:
		@echo 'Installing dependencies.'
		bash ./scripts/install-deps.sh

install-aur:
		@echo 'Installing aur dependencies.'
		bash ./scripts/install-aur.sh

install-language-servers:
		@echo 'Installing LSP Language Servers.'
		bash ./scripts/install-language-servers.sh

install-npm:
		@echo 'Install NPM Packages.'
		bash ./scripts/install-node-packages.sh

install-rust:
		@echo 'Installing Rust.'
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

configure-sys:
		@echo 'Configuring system defaults.'
		bash ./scripts/configure-sys.sh

install-git-repos:
		@echo 'Installing git repositories.'
		bash ./scripts/install-git-repos.sh

ensure-deps:
		@echo 'Ensuring dependencies.'
		$(MAKE) install-chezmoi
		$(MAKE) install-deps
		$(MAKE) install-aur
		$(MAKE) install-rust
		$(MAKE) install-language-servers
		$(MAKE) install-npm

run:
		$(MAKE) ensure-deps
		$(MAKE) chezmoi-init
		$(MAKE) chezmoi-apply
		@echo "Done"

all:
		$(MAKE) ensure-deps
		$(MAKE) install-git-repos
		$(MAKE) configure-sys
		$(MAKE) chezmoi-init
		$(MAKE) ensure-dirs
		$(MAKE) chezmoi-apply
