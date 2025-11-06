#!/bin/sh

echo "Setting up your Mac..."

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &>/dev/null; then
  echo "Xcode Command Line Tools not found. Installing..."
  xcode-select --install
else
  echo "Xcode Command Line Tools already installed."
fi

# Check if Fish is installed and set it as the default shell if desired
if command -v fish &>/dev/null; then
  if ! grep -q "$(command -v fish)" /etc/shells; then
    substep_info "Adding Fish to available shells..."
    sudo sh -c "echo $(command -v fish) >> /etc/shells"
  fi
  read -p "Do you want to set Fish as your default shell? (y/N): " -n 1 -r
  echo # Move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    chsh -s "$(command -v fish)"
  fi
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle --file ./Brewfile

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos
