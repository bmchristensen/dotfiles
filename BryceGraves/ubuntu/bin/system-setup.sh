#!/bin/bash
# ----------------------
# Automated System Setup
# ----------------------

echo "
  ================================
  Starting Automated System Setup!
  ================================

"

echo "
  -------------------------------
  Starting full system upgrade...
  -------------------------------

"
sudo apt update
sudo apt full-upgrade -y

echo "
  -----------------------------
  Full system upgrade complete!
  -----------------------------

"

echo "
  ------------------------------------
  Setting up basic directory structure
  ------------------------------------

"

cd
mkdir Code Programs Stolen
cd Stolen
mkdir Books Movies Recent Shows
cd

echo "
  ----------------------------------
  Directory structure setup complete
  ----------------------------------

"

echo "
  --------------------------------------------------------------------------
  Setting up development environment and installing other important packages
  --------------------------------------------------------------------------

"

echo "

  <---- Starting package installs and purges ---->

"
sudo apt update

echo "

  <---- Purging unwanted preinstalls ---->

"
sudo apt purge -y vim
sudo apt purge -y firefox

echo "

  <---- Utils ---->

"
sudo apt install -y build-essential
sudo apt install -y fzf
sudo apt install -y software-properties-common
sudo apt install -y curl wget xclip
sudo apt install -y libssl-dev libreadline-dev zlib1g-dev

echo "

  <---- Git ---->

"
sudo apt install -y git

echo "

  <---- Python and Pip ---->

"
sudo apt install -y python3
sudo apt install -y python3-pip

echo "

  <---- Neovim ---->

"
sudo apt install -y neovim

echo "

  <---- Java jdk and jre ---->

"
sudo apt install -y default-jdk default-jre

echo "

  <---- Finalizing python install ---->

"
pip3 install setuptools wheel

echo "

  <---- AWS cli ---->

"
sudo apt install -y awscli

echo "

  <---- Adding javascript linters to user root ---->

"
cp dotfiles-master/BryceGraves/ubuntu/src/.eslintrc .eslintrc
cp dotfiles-master/BryceGraves/ubuntu/src/.prettierrc .prettierrc

echo "
  --------------------
  Installing oh-my-zsh
  --------------------

"
sudo apt install -y --install-suggests python3-pygments zsh
echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp dotfiles-master/BryceGraves/ubuntu/src/.zshrc .zshrc

echo "
  -------------------------
  Done installing oh-my-zsh
  -------------------------

"

echo "
  -------------------------------
  Installing powerlevel 10k theme
  -------------------------------

"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

echo "
  ------------------------------------
  Done installing powerlevel 10k theme
  ------------------------------------

"

echo "
  -------------------------------
  Adding custom oh-my-zsh plugins
  -------------------------------

"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

echo "
  ------------------------------------
  Done adding custom oh-my-zsh plugins
  ------------------------------------

"

echo "
  ----------------------------------------------
  Setting up nvm, node, rbenv, and yarn with zsh
  ----------------------------------------------

"

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/tpope/rbenv-aliases.git ~/.rbenv/plugins/rbenv-aliases
git clone https://github.com/rbenv/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

echo "source ~/.zshrc; rbenv alias --auto; rbenv install 2.6.5; rbenv install 2.7.2; sudo npm install -g yarn; exit" | zsh

echo "
  --------------------------------
  Setting up nvm and node with zsh
  --------------------------------

"

echo "
  ----------------------------------------
  Setting up nerd fonts used for oh-my-zsh
  ----------------------------------------

"
echo "source ~/.zshrc; nvm install node; exit" | zsh

cd Programs
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd

echo "
  -----------------------------------------
  Done setting up and installing nerd fonts
  -----------------------------------------

"

echo "
  ---------------------------
  Setting up terminal styling
  ---------------------------

"

echo "ALL" | bash -c "$(wget -qO- https://git.io/vQgMr)"

echo "

  <---- Setting up golang now since it requires a zshrc update ---->

"
cd Programs
wget -O go https://storage.googleapis.com/golang/getgo/installer_linux
chmod +x go
./go
cd

echo "
  -------------------------------
  Setting up desktop applications
  -------------------------------

"

echo "<---- Chrome ---->

"
cd Programs
wget -O google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome.deb
cd

echo "<---- VLC ---->

"
sudo snap install vlc

echo "<---- Deluge ---->

"
sudo snap install deluge-lukewh

echo "<---- VS Code Insiders ---->

"
sudo snap install code-insiders --classic

echo "<---- Discord ---->

"
sudo snap install discord

echo "<---- Telegram ---->

"
sudo snap install telegram-desktop

echo "<---- Spotify ---->

"
sudo snap install spotify

echo "<---- Slack ---->

"
sudo snap install slack

echo "
  -----------
  Cleaning up
  -----------

"

cd Programs
rm -rf *
cd
rm -rf dotfiles-master

echo "
  ---------------------
  System Setup Complete
  ---------------------
"
