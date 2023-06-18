#!/bin/bash
#
if [[ "$OSTYPE" == "linux-gnu"* ]]; then

  sudo apt-get upgrade
  sudo apt-get update
  if ! command -v zsh &> /dev/null; then
    sudo apt install zsh  
    echo whereis zsh
  fi

  chsh -s $(which zsh)
  echo 'Shell changed to zsh'


  # Install Oh My Zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Install Powerlevel10k theme
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
  
  # Configure Zsh to use Powerlevel10k
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

  # Reload Zsh configuration
  source ~/.zshrc

#  sudo apt install wget
#  sudo apt install git

  # set up nvim
  sudo apt install neovim
  if [ -d ~/.config/nvim ]; then
    echo "nvim folder exists, moving to backup"

    mv ~/.config/nvim ~/.config/nvim.backup
    rm -rf ~/.local/share/nvim/
  fi

  ln -s  ~/.dotfiles/.config/nvim/ ~/.config/nvim
  # alias vi='nvim'
  # alias vi='neovim'
  echo 'Neovim has been installed and mapped to vi'

  # Symlink fonts
#  ln -s ~/.dotfiles/.fonts  ~/.fonts
#  # Install fonts
#  if [[ "${PLATFORM}" == "linux" ]]; then
#		if ! type -P "fc-cache" >/dev/null; then
#			sudo apt update && sudo apt install -y fontconfig
#		fi
#		sudo fc-cache -f
#	fi


  ln -s ~/.dotfiles/.zshrc ~/.zshrc
# sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  
  exec zsh
# elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
# elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
# elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
 fi


