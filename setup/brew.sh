#!/usr/bin/env bash
set -e

# Install Homebrew & command-line tools & casks
xcode-select --install || true
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

echo "eval \"\$(${HOMEBREW_PREFIX}/bin/brew shellenv)\"" >> ~/.bash_profile
eval "\$(${HOMEBREW_PREFIX}/bin/brew shellenv)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
echo "export PATH=$(brew --prefix coreutils)/libexec/gnubin:\$PATH" >> ~/.path

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
echo "export PATH=$(brew --prefix gnu-sed)/libexec/gnubin:\$PATH" >> ~/.path

# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget`
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg
brew install pinentry-mac
echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent

# Install more recent versions of some macOS tools.
brew install vim
echo "export PATH=$(brew --prefix vim)/bin:\$PATH" >> ~/.path

# Install useful binaries
brew install ack
brew install blueutil
brew install grep
brew install nmap
brew install openssh
brew install rclone
brew install sleepwatcher
brew install ssh-copy-id
brew install tree
brew install yt-dlp

# Install dev tools
brew install foreman
brew install git
brew install git-lfs
brew install jo
brew install jq
brew install pgcli
brew install postgresql
brew install puma-dev
brew install redis

# Install apps
brew install --cask 1password
brew install --cask aldente
brew install --cask appcleaner
brew install --cask balance-lock
brew install --cask datovka
brew install --cask discord
brew install --cask docker
brew install --cask finicky
brew install --cask firefox
brew install --cask firefox-developer-edition
brew install --cask free-download-manager
brew install --cask google-chrome
brew install --cask haptickey
brew install --cask hiddenbar
brew install --cask hyperkey
brew install --cask imageoptim
brew install --cask lulu
brew install --cask mounty
brew install --cask onedrive
brew install --cask rubymine
brew install --cask signal
brew install --cask slack
brew install --cask spectacle
brew install --cask spotify
brew install --cask suspicious-package
brew install --cask the-unarchiver
brew install --cask unnaturalscrollwheels
brew install --cask visual-studio-code
brew install --cask vlc

# Remove outdated versions from the cellar.
brew cleanup
