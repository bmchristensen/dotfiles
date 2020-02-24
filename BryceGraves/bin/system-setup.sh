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
apt update
apt full-upgrade -y

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
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.listecho "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

echo "

  <---- Golang ---->
"
echo | add-apt-repository ppa:longsleep/golang-backports


echo "

  <---- Docker ---->
"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
echo | add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "

  <---- Installing all packages ---->

"
apt update
apt install -y --install-suggests build-essential curl git dconf-cli uuid-runtime wget \
ctags vim-scripts neovim default-jre default-jdk python python3 python-pip python3-pip \
python-neovim python3-neovim xclip yarn golang-go apt-transport-https ca-certificates \
software-properties-common docker-ce nginx mysql-server php5-fpm php5-mysql autoconf \
bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev

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

  <---- Finalizing docker install ---->

"

groupadd docker
usermod -aG docker $USER

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

apt install -y python-pygments
apt install -y zsh
wget –no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O – | sh
chsh -s /bin/zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
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

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/${USER}/.oh-my-zsh/custom/themes/powerlevel10k

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

git clone https://github.com/zsh-users/zsh-autosuggestions /home/${USER}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/${USER}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
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
git clone git@github.com:ryanoasis/nerd-fonts.git
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

apt install -y libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -y ./google-chrome*.deb

echo "<---- Purging firefox ---->

"
apt purge -y firefox

echo "<---- VLC ---->

"
apt install -y vlc

echo "<---- Deluge ---->

"
echo | add-apt-repository ppa:deluge-team/stable
apt update
apt install -y deluge

echo "<---- VS Code Insiders ---->

"
cd Programs
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt update
apt install -y code-insiders
cd

echo "<---- Discord ---->

"
cd Programs
wget "https://discordapp.com/api/download?platform=linux&format=deb"
apt install -y ./discord*.deb
cd

echo "<---- Telegram ---->

"
echo | add-apt-repository ppa:atareao/telegram
apt update
apt install -y telegram



echo "<---- Spotify ---->

"

apt-add-repository -y "deb http://repository.spotify.com stable non-free"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys A87FF9DF48BF1C90
apt update
apt install spotify-client -y --allow-unauthenticated

echo "<---- Slack ---->

"
cd Programs
wget "https://downloads.slack-edge.com/linux_releases/slack-desktop-4.3.2-amd64.deb"
apt install -y ./slack*.deb
cd
