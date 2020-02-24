#!/bin/bash
# ----------------------
# Automated System Setup
# ----------------------

# TODO:
# - [] add message about what I still need to do post update
# - [] add colored messages
# - [] move installs to different functions

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
mkdir books movies recent shows
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

  <---- Yarn ---->
"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo "

  <---- Golang ---->
"
add-apt-repository -y ppa:longsleep/golang-backports

echo "

  <---- Installing all packages ---->

"
sudo apt update
sudo apt install -y --install-suggests build-essential curl git dconf-cli uuid-runtime wget \
ctags vim-scripts neovim default-jre default-jdk python python3 python-pip python3-pip \
python-neovim python3-neovim xclip yarn golang-go apt-transport-https ca-certificates \
software-properties-common nginx mysql-server php-fpm php-mysql autoconf \
bison libssl-dev libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev docker.io \
libxss1 libappindicator1 libindicator7

echo "

  <---- Setting up rbenv ---->

"

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/tpope/rbenv-aliases.git ~/.rbenv/plugins/rbenv-aliases
rbenv alias --auto
git clone https://github.com/rbenv/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
rbenv install 2.5.1
rbenv install 2.6.5


echo "

  <---- Finalizing nginx install ---->

"

service nginx restart

echo "

  <---- Setting docker to run on start  ---->

"
systemctl start docker
systemctl enable docker

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
  ----------------------------------------
  Setting up nerd fonts used for oh-my-zsh
  ----------------------------------------

"

cd Programs
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd

echo "
  ---------------------------
  Setting up terminal styling
  ---------------------------

"

echo "ALL" | bash -c  "$(wget -qO- https://git.io/vQgMr)"

echo "
  -----------------------------------------
  Done setting up and installing nerd fonts
  -----------------------------------------

"

echo "
  -------------------------------
  Setting up desktop applications
  -------------------------------

"

echo "<---- Chrome ---->

"
cd Programs
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome*.deb
cd

echo "<---- Purging firefox ---->

"
sudo apt purge -y firefox

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
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code-insiders
cd

echo "<---- Discord ---->

"
cd Programs
wget "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install -y ./discord*.deb
cd

echo "<---- Telegram ---->

"
sudo add-apt-repository -y ppa:atareao/telegram
sudo apt update
sudo apt install -y telegram



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
