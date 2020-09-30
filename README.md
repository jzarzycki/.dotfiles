# My dotfiles
In order to use:
```sh
git clone http://www.github.com/jzarzycki/.dotfiles
cd .dotfiles
stow --adopt -vt ~ *
```

# Installing neovim plugins
```sh
cd nvim/.config/nvim
git clone https://github.com/VundleVim/Vundle.vim.git bundle
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
# in case of problems, theese apt comands fixed python provider problems the last time: https://github.com/ycm-core/YouCompleteMe/issues/1866#issuecomment-242838358
pip3 install --user --upgrade pynvim
python3 install.py --clangd-completer --go-completer --ts-completer
```

# Installing zsh plugins:
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # ohmyzsh:
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```
