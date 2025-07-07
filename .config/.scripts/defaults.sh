#!/usr/bin/env sh

# Key Repeat Settings
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool "FALSE"

# Dock Configuration
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock show-recents -bool "FALSE"
defaults write com.apple.dock autohide -bool "TRUE"
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock minimize-to-application -bool "TRUE"
defaults write com.apple.dock persistent-apps -array-add ""
defaults write com.apple.dock static-only -bool "TRUE"
defaults write com.apple.dock mru-spaces -bool "FALSE"

# Screenshot Location
defaults write com.apple.screencapture location -string ~/dirs/p/screenshots

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool "TRUE"
defaults write com.apple.finder ShowPathBar -bool "TRUE"
defaults write com.apple.finder _FXSortFoldersFirst -bool "TRUE"

# Start on login
defaults write com.knollsoft.Rectangle launchOnLogin -int 1
defaults write com.displaylink.DisplayLinkUserAgent AppAutostart -int 1

# Kill things that are impacted
killall Finder
killall Dock
