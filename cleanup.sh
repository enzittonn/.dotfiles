#!/bin/bash

# Remove Zsh configuration files
rm -rf "$HOME/.zshrc"
rm -rf "$HOME/.zshenv"
uninstall_oh_my_zsh
rm -rf "$HOME/.oh-my-zsh"

# Remove Powerlevel10k theme
rm -rf "$HOME/.p10k.zsh"

# Remove nvchad
rm -rf "$HOME/.config/nvim"

# Restore default shell
chsh -s /bin/bash

echo "Cleanup complete. Dotfiles and settings have been removed."

