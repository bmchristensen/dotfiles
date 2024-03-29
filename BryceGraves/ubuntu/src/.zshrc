# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Declare mode
POWERLEVEL9K_MODE='nerdfont-complete'

# Element attributes
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_HIDE_ABOVE_THRESHOLD=10

# Assign elements to left or right prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs go_version rspec_stats rbenv nvm battery)

# Declare theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Add this line to use code-insiders instead of code
VSCODE=code-insiders

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# I ADD WHAT I WANT REEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
plugins=(
  aws
  battery
  bundler
  colored-man-pages
  colorize
# TODO: keep an eye on this... not sure what changed by this was causing both a return of 1 on terminal load and breaking nvm
#  common-aliases
  debian
  dircycle
  docker
  docker-compose
  docker-machine
  fzf
  gem
  git
  golang
  nvm
  rails
  rbenv
  ruby
  # TODO: work on fixing safe paste breaking sub-string suggestions and pr it
  # safe-paste
  sudo
  taskwarrior
  vscode
  yarn
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-navigation-tools
  zsh-nvm
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
alias -g lls="ls"
alias -g c="clear"
alias -g m="make"
alias -g mc="make clean"
alias -g ssh-osu="ssh gravebry@flip.engr.oregonstate.edu"
alias -g ssh-os1="ssh gravebry@os1.engr.oregonstate.edu"
alias -g tl="task list"
alias -g co="code-insiders"
alias -g lg="lazygit"

# Personal Exports

export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK=$ANDROID_HOME
export JAVA_HOME=/usr/lib/jvm/default-java
export GOPATH=$HOME/Code/go

export PATH="$PATH:$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$HOME/.rbenv/bin:/snap/bin:/opt/yarn-[version]/bin:$HOME/.local/bin:$HOME/.go/bin:$HOME/Code/go/bin"

eval "$(rbenv init -)"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

PROG=todoist source "/home/bryceg/Code/go/pkg/mod/github.com/urfave/cli/v2@v2.25.1/autocomplete/zsh_autocomplete"

