######################################################
#                  _________  _   _                  #
#                 |__  / ___|| | | |                 #
#                   / /\___ \| |_| |                 #
#                  / /_ ___) |  _  |                 #
#                 /____|____/|_| |_|                 #
#                                                    #
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com> #
######################################################


#######################################################################
#                           PERFORMANCE                               #
#######################################################################
# HOW TO FIND THE SLOW PART OF LOADING ZSH:
# $ zsh -xv

# REF: https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
# !!! SPEED UP ZSH FOR 1+ SECOND BY SKIPPING /etc/zsh
skip_global_compinit=1

# REF: https://gist.github.com/ctechols/ca1035271ad134841284
# autoload -Uz compinit
# if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
# 	compinit;
# else
# 	compinit -C;
# fi;

#######################################################################
#                      IMPORT MODULIZED SETTINGS                      #
#######################################################################

if [[ "$0" =~ "zsh" ]]; then  # >>> PLUGINS >>>
    source ~/myconf/dotfiles/zsh/ohmyzsh-settings.sh
    # source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-theme-minimal.sh
    # source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-theme-powerlevel10k.sh
    source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-syntax-highlighting.sh
    # source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-autocomplete.sh
    source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-autosuggestions.sh
    source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-cmd-time.sh
    source ~/myconf/dotfiles/zsh/pluginconfigs/fzf.sh
    # source ~/myconf/dotfiles/zsh/pluginconfigs/autojump.sh
    # source ~/myconf/dotfiles/zsh/pluginconfigs/broot.sh
    source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-cmd-time.sh
    # source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-prompt-benchmark.sh
fi
source ~/myconf/dotfiles/zsh/bash-alias.sh
source ~/myconf/dotfiles/zsh/bash-functions.sh
[[ -e ~/.bashrc-local.sh ]] && source ~/.bashrc-local.sh ||true


#######################################################################
#                          GENERAL SETTINGS                           #
#######################################################################
# Vi mode
# set editing-mode vi

# Default Editor (Ctrl-x plus Ctrl-e to pop editor for current shell command)
# [[ -e $(command -v nvim) ]] && export EDITOR=nvim || export EDITOR=vim
export EDITOR=nvim || export EDITOR=vim
alias vim="nvim" && alias vimdiff="nvim -d"

# set -o vi

# Get rid of "you have a mail" from crontab
MAILCHECK=0

# History
HISTFILE=~/.bash_history
HISTSIZE=50000
SAVEHIST=10000
setopt appendhistory
setopt extendedhistory
setopt sharehistory
setopt incappendhistory

# User-specified hosts (not working at the moment)
# set HOSTALIASES=~/hosts

# Set Default Title (Useful for Tmux pane-border title)
# printf "\033]0;%s\a" "TITLE"  #THIS JEPERDIZE SOME PROGRAMS (etc., ANSIBLE)


#zstyle ':completion:*' menu select # select completions with arrow keys
#zstyle ':completion:*' group-name '' # group results by category
# enable approximate matches for completion
#zstyle ':completion:::::' completer _expand _complete _ignored _approximate
# [ Conflict options ]
    #setopt auto_list # automatically list choices on ambiguous completion
    #setopt auto_menu # automatically use menu completion
    #setopt always_to_end # move cursor to end if word had one match
    #setopt correct_all # autocorrect commands
# [ Compatible with BASH ]
    # -> Fixing error: "zsh: no matches found"
    setopt no_nomatch


#######################################################################
#                       KEY BINDINGS / MAPPINGS                       #
#######################################################################
if [[ "$0" =~ "zsh" ]]; then
    bindkey '^p' up-line-or-search # Up arrow
    bindkey '^n' down-line-or-search # Down arrow
    # [autosuggestions] (history conflict with zsh hints, not recommanded)
    # bindkey '^e' autosuggest-accept # [Essential] Ctrl+e to confirm hint
    bindkey "^[[1;5D" backward-word  # ctrl-left
    bindkey "^[[1;5C" forward-word  # ctrl-right
    bindkey "^A" vi-beginning-of-line
    bindkey "^e" vi-end-of-line
    bindkey "^k" backward-kill-line
    # Conflict with fzf ---> (Allow ctrl-a ctrl-e to jump to the head/tail of the line)
    # bindkey -e
fi


#######################################################################
#                             GENERAL UI                              #
#######################################################################
# REF: https://geoff.greer.fm/lscolors/
export LS_COLORS='di=1;34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
# export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:'



#######################################################################
#                    PATH / ENVIRONMENT VARIABLES                     #
#######################################################################
# Some would be imported here by other programms automatically
# etc., cat 'expot path=...' > ~/.zshrc

# IMPORTANT!!
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"  # Curl newer version
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
# =====PYTHON=====
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export PATH="/usr/local/opt/python@2/bin:$PATH"
export PATH="/usr/local/opt/python@3/bin:$PATH"
export PATH="$HOME/virtualenv/venv/bin:$PATH"
export PATH="$HOME/virtualenv/venv2/bin:$PATH"
# =====NODE.JS=====
export PATH="$HOME/.nvm/versions/node/v10.17.0/bin:$PATH"

export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"

#######################################################################
#                              HOMEBREW                               #
#######################################################################
export HOMEBREW_NO_AUTO_UPDATE=1


#Java
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home"
# export JAVA_HOME=$(/usr/libexec/java_home)

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/mc mc

# added by Snowflake SnowSQL installer v1.2
export PATH=/Users/xiaoboxie/Applications/SnowSQL.app/Contents/MacOS:$PATH

# NVM (Node) ==> SLOWING DOWN SHELL!!!
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
