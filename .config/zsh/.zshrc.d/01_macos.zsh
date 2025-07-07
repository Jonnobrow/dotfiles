# macos globals
if [[ "$OSTYPE" == darwin* ]]; then

  path=(
    /opt/homebrew/bin
    $path
  )
  
  if (( $+commands[brew] )); then

    # Add gnubin to path
    path=(
      $(brew --prefix)/opt/coreutils/libexec/gnubin
      $(brew --prefix)/opt/make/libexec/gnubin
      $(brew --prefix)/opt/findutils/libexec/gnubin
      $(brew --prefix)/opt/grep/libexec/gnubin
      $path
    )
    
    # No automatic updates
    export HOMEBREW_NO_AUTO_UPDATE=true

    # Aliases for brew bundle
    alias bbi="brew bundle install --global --force"
    alias bbd="brew bundle dump --global --force --taps --casks --brews"
    alias bbc="brew bundle cleanup --global --force"

  fi

fi
