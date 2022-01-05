# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ashu_rane/.oh-my-zsh"

term=`basename "/"$(ps -f -p $(cat /proc/$(echo $$)/stat | cut -d \  -f 4) | tail -1 | sed 's/^.* //')`


if [ "$term" = "gnome-terminal-server" ]; then
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
elif [ "$term" = "alacritty" ]; then
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
    [[ ! -f ~/.p11k.zsh ]] || source ~/.p11k.zsh
else
    ZSH_THEME="random"
    ZSH_THEME_RANDOM_QUIET=true #sunrise nicoulaj
    ZSH_THEME_RANDOM_CANDIDATES=( "muse" "sorin" )
    #source /home/ashu_rane/.config/zsh/zshrc
fi



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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

#plugins
source $(dirname $(gem which colorls))/tab_complete.sh

alias lc="colorls --sd -A"
alias lsc="colorls"
alias cl="clear"
alias nv="nvim"
alias v="vim"
alias t="tmux"
alias r="ranger"
alias chrome="google-chrome $1 &"
# alias gedit="gedit $1 2>/dev/null &"
export SUDO_EDITOR=kate
alias skate='sudoedit'
alias vim='nvim'
alias tedit=' org.gnome.TextEditor'

bindkey -s '^o' 'ranger^M'
bindkey -s '^s' 'ncdu^M'


plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    colorize
    copyfile
    extract
    docker
    fzf
    tmux
    themes
    zsh-interactive-cd
    history-substring-search
    colored-man-pages
    zsh-z
  )

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
export PATH=/home/ashu_rane/.local/bin:$PATH
export PATH=/home/ashu_rane/.local/share/gem/ruby/3.0.0/bin:$PATH 
export FZF_DEFAULT_COMMAND='fdfind --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

#fnm
export PATH=/home/$USER/.local/bin/fnm:$PATH
eval `fnm env`
eval "$(fnm env)"
fpath+=~/.config/zsh/completions/_fnm
compinit

#conda
export PATH="$PATH:$HOME/.miniconda/bin"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ashu_rane/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ashu_rane/.miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/ashu_rane/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/ashu_rane/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

colorscript random
