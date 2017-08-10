####### Start oh-my-zsh #######
###############################

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
source ~/.fonts/lib/*.sh # Load all the icon vars from nerd fonts

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#POWERLEVEL9K_MODE="awesome-patched"
POWERLEVEL9K_MODE="nerdfont-complete"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context background_jobs dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="$i_ple_pixelated_squares_big "
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="" # " $i_pl_right_soft_divider"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_DIR_PATH_SEPARATOR=" $i_pl_left_soft_divider "
POWERLEVEL9K_VCS_GIT_GITHUB_ICON="$i_oct_octoface "
POWERLEVEL9K_STATUS_VERBOSE="true"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="white"

POWERLEVEL9K_PROMPT_ON_NEWLINE="true"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="" # "\u250f\u2501"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="$ " # "\u2517$ " #"\u2517\u276f "
POWERLEVEL9K_PROMPT_ADD_NEWLINE="true"

#POWERLEVEL9K_BATTERY_CHARGING="yellow"
#POWERLEVEL9K_BATTERY_CHARGED="green"
#POWERLEVEL9K_BATTERY_DISCONNECTED="$DEFAULT_COLOR"
#POWERLEVEL9K_BATTERY_LOW_THRESHOLD="20"
#POWERLEVEL9K_BATTERY_LOW_COLOR="red"
#POWERLEVEL9K_BATTERY_VERBOSE="false"
## Background
#POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="025"
#POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="025"
#POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="025"
#POWERLEVEL9K_BATTERY_LOW_BACKGROUND="025"

DEFAULT_USER="$USER"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sublime sudo macports history python extract yarn)

# User configuration

export PATH="/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"
export PATH="~/Library/Python/3.5/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Colors for ls
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

editor=`which nvim`
export EDITOR="$editor"
export VISUAL="$editor"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias nbm="mvm 4; pushd ~/Code/Logos-Desktop-Dev/DigitalLibrary/src/macintosh/; nant build-managed; popd; mvm 5"
alias cl="clone-leeroy"

alias ip='curl icanhazip.com'
alias gh='cd ~/Programming/Github\ Repos'
alias gdbgui="sudo echo; python -c \"__import__('time').sleep(1.5); __import__('webbrowser').open('http://127.0.0.1:1337')\" &; sudo ~/Library/Python/3.5/bin/gdbgui -g /opt/local/bin/ggdb -p1337 -n"
alias zshrc="$EDITOR ~/.zshrc && source ~/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"
alias spu="sudo port selfupdate"

cutleaves() {
    sudo port uninstall inactive
    sudo port clean --all installed

    # (do while)
    while : ; do
        sudo port uninstall leaves
        [ $? -eq 0 ] || break
    done
}

search() {
    s="$1"
    mdfind -onlyin . "$s" | while IFS= read -r f; do
        cat "$f" | grep -E "$s" && (
            print -P "%F{cyan}"
            echo ".${f#`pwd`}"
            print -P "%f"
        )
    done
}

# List files changed between a commit range
glc() {
    commit_range="$1"
    git log --name-only --pretty=oneline --full-index "$commit_range" | grep -vE '^[0-9a-f]{40} ' | sort | uniq
}

####### End oh-my-zsh #######
#############################

