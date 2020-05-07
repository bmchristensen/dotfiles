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

  <---- Adding all keys for for development packages ---->

"

echo "

  <---- Golang ---->
"
sudo add-apt-repository -y ppa:longsleep/golang-backports

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

  <---- AWS ---->

"
sudo apt install -y awscli

echo "

  <---- Utils ---->

"
sudo apt install -y build-essential
sudo apt install -y fzf
sudo apt install -y software-properties-common
sudo apt install -y curl wget xclip

echo "

  <---- Git ---->

"
sudo apt install -y git

echo "

  <---- Python and Pip ---->

"
sudo apt install -y python python3
sudo apt install -y python-pip python3-pip

echo "

  <---- Neovim ---->

"
sudo apt install -y neovim

echo "

  <---- Golang ---->

"
sudo apt install -y golang-go

echo "

  <---- Java jdk and jre ---->

"
sudo apt install -y default-jdk default-jre

echo "

  <---- Finalizing python install ---->

"
pip install setuptools wheel
pip3 install setuptools wheel

echo "

  <---- Adding javascript linters to user root ---->

"
cp dotfiles/BryceGraves/src/.eslintrc .eslintrc
cp dotfiles/BryceGraves/src/.prettierrc .prettierrc


echo "
  --------------------
  Installing oh-my-zsh
  --------------------

"
sudo apt install -y --install-suggests python-pygments zsh
echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp dotfiles/BryceGraves/src/.zshrc .zshrc

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
  --------------------------------------------
  Setting up nvm,node,rbenv, and yarn with zsh
  --------------------------------------------

"

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/tpope/rbenv-aliases.git ~/.rbenv/plugins/rbenv-aliases
git clone https://github.com/rbenv/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

echo "source ~/.zshrc; rbenv alias --auto; rbenv install 2.5.1; rbenv install 2.6.5; sudo npm install -g yarn; exit" | zsh

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

echo "ALL" | bash -c  "$(wget -qO- https://git.io/vQgMr)"

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
sudo apt install -y vlc

echo "<---- Deluge ---->

"
sudo add-apt-repository -y ppa:deluge-team/stable
sudo apt update
sudo apt install -y deluge

echo "<---- VS Code Insiders ---->

"
cd Programs
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code-insiders
cd

echo "<---- Discord ---->

"
cd Programs
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install -y ./discord.deb
cd

echo "<---- Telegram ---->

"

wget -O- https://telegram.org/dl/desktop/linux | sudo tar xJ -C ./Programs
./Programs/Telegram/Telegram &
PID=$!
sleep 1
kill $PID

echo "<---- Spotify ---->

"

curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client

echo "<---- Slack ---->

"
cd Programs
wget "https://downloads.slack-edge.com/linux_releases/slack-desktop-4.3.2-amd64.deb"
sudo apt install -y ./slack*.deb
cd

echo "
  -----------
  Cleaning up
  -----------

"

cd Programs
rm -rf *
cd
rm -rf dotfiles

echo "
  ---------------------
  System Setup Complete
  ---------------------
"
