# My dotfiles
In order to use:
```sh
git clone https://github.com/jzarzycki/.dotfiles.git
cd .dotfiles
stow --adopt -vt ~ */
```

# Installing neovim plugins
```sh
cd nvim/.config/nvim
mkdir bundle
cd bundle
git clone https://github.com/VundleVim/Vundle.vim.git
nvim
# inside neovim:
:PluginInstall
ZQZQ # exit vim
cd YouCompleteMe
# make sure you have
# - cmake
# - python3
# - node and npm for JS/TS completion
# - go for golang completion
# installed

# for arch:
sudo pacman -S cmake python3 npm go
pip3 install --user --upgrade pynvim
# install from AUR package neovim-youcompleteme-core-git
python3 install.py --clangd-completer --go-completer --ts-completer
```

# Installing zsh plugins:
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # ohmyzsh:
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```
