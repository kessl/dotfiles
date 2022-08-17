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

# Install more recent versions of some macOS tools.
brew install vim
echo "export PATH=$(brew --prefix vim)/bin:\$PATH" >> ~/.path

brew install grep
brew install openssh
# brew install screen
# brew install php
# brew install gmp

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
brew install binutils
brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
# brew install gs
# brew install imagemagick --with-webp
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rlwrap
brew install ssh-copy-id
brew install tree
# brew install vbindiff
# brew install zopfli

# DK's additional utilites
brew install blueutil
brew install jo
brew install jq
brew install sleepwatcher
brew install yarn
brew install youtube-dl

# DK's casks
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
brew install --cask iterm2
brew install --cask mounty
brew install --cask onedrive
brew install --cask postman
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
