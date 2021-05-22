default: run
help:
	@echo 'Management commands for dotfiles:'
	@echo
	@echo 'Usage:'
	@echo ''
	@echo 'Author:	Jonathan Bartlett <jonathan@jonnobrow.co.uk>'
	@echo


# Utilities
update-bundle-files:
	@echo 'Updating Aur Bundle File'
	pacman -Qmeq > Aurfile
	@echo 'Updating Pacman Bundle File'
	pacman -Qneq > Pacfile
	@echo 'Updateing NodeJS Bundle File'
	npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$$1); print}' > Npmfile

# Install Stuff
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

install-firefox:
	@echo 'Installing FlyingFox.'
	bash ./scripts/install-firefox.sh

install-other-configs:
	@echo 'Install Configs outside of user space.'
	bash ./scripts/install-other-config.sh

configure-sys:
	@echo 'Configuring system defaults.'
	bash ./scripts/configure-sys.sh

install-git-repos:
	@echo 'Installing git repositories.'
	bash ./scripts/install-git-repos.sh

start-services:
	@echo 'Starting Services'
	bash ./scripts/start-services.sh

ensure-deps:
	@echo 'Ensuring dependencies.'
	$(MAKE) install-chezmoi
	$(MAKE) install-deps
	$(MAKE) install-aur
	$(MAKE) install-language-servers
	$(MAKE) install-npm
	$(MAKE) install-firefox

run:
	$(MAKE) ensure-deps
	$(MAKE) chezmoi-init
	$(MAKE) chezmoi-apply
	$(MAKE) install-other-configs
	$(MAKE) start-services
	@echo "Done"

all:
	$(MAKE) ensure-deps
	$(MAKE) install-git-repos
	$(MAKE) configure-sys
	$(MAKE) chezmoi-init
	$(MAKE) ensure-directories
	$(MAKE) chezmoi-apply
	$(MAKE) install-other-configs
	$(MAKE) start-services
