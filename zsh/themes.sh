########################################################
#         _____ _                                      #
#        |_   _| |__   ___ _ __ ___   ___  ___         #
#          | | | '_ \ / _ \ '_ ` _ \ / _ \/ __|        #
#          | | | | | |  __/ | | | | |  __/\__ \        #
#          |_| |_| |_|\___|_| |_| |_|\___||___/        #
#                                                      #
########################################################
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>

# [General UI Settings] {
    # colorful `ls`
    export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:'
# }

check_oh_my_zsh(){
    if [ ! -e ~/.oh-my-zsh ]; then
        # If haven't installed oh-my-zsh, then install it
        export ZSH=~/.oh-my-zsh
        source $ZSH/oh-my-zsh.sh
    fi
}
#check_oh_my_zsh


# [ Awesome Panda ]
set_theme_awesomepanda(){
    export TERM="xterm-256color"
    export ZSH_THEME="awesomepanda"
}


# [ Avit ]
set_theme_junkfood(){
    export TERM="xterm-256color"
    export ZSH_THEME="junkfood"
}


# [ Agnoster ]
set_theme_agnoster(){
    # Preload dependencies:
        if [ ! -e ~/.oh-my-zsh/themes/agnoster.zsh-theme ]; then
            wget https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme -P ~/.oh-my-zsh/themes/
        fi
        export TERM="xterm-256color"
        export ZSH_THEME="agnoster"
    # Hide Username and Hostname
        DEFAULT_USER=$USER
        #prompt_context() {}
    # Hide Hostname only {
        prompt_context() {
          if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
            prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
          fi
        }
    # }
}

set_theme_spaceship(){
    export ZSH_THEME="spaceship"
    SPACESHIP_PROMPT_ORDER=(
        time          # Time stamps section
        user          # Username section
        dir           # Current directory section
        host          # Hostname section
        git           # Git section (git_branch + git_status)
        hg            # Mercurial section (hg_branch  + hg_status)
        package       # Package version
        node          # Node.js section
        ruby          # Ruby section
        elixir        # Elixir section
        xcode         # Xcode section
        swift         # Swift section
        golang        # Go section
        php           # PHP section
        rust          # Rust section
        haskell       # Haskell Stack section
        julia         # Julia section
        docker        # Docker section
        aws           # Amazon Web Services section
        venv          # virtualenv section
        conda         # conda virtualenv section
        pyenv         # Pyenv section
        dotnet        # .NET section
        ember         # Ember.js section
        kubecontext   # Kubectl context section
        terraform     # Terraform workspace section
        exec_time     # Execution time
        line_sep      # Line break
        battery       # Battery level and status
        vi_mode       # Vi-mode indicator
        jobs          # Background jobs indicator
        exit_code     # Exit code section
        char          # Prompt character
    )
}

# [ PowerLevel9k ]
set_theme_powerlevel9k(){
    # Preload dependencies:
        if [ ! -e ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
            git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
        fi
        export TERM="xterm-256color"
        export ZSH_THEME="powerlevel9k/powerlevel9k"
    # Hide Username and Hostname
        export DEFAULT_USER=$USER
    #PowerLevel9k 字体字体模式设定 (必须放在主题之前）
    #参考：https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-2-use-a-programmer-font
        POWERLEVEL9K_MODE='nerdfont-complete'
        #POWERLEVEL9K_MODE='awesome-fontconfig'

    # 左右元素指定 --------{
        # Elements: （指定的关键字参考官网）
        # background_jobs battery context dir dir_writable
        # disk_usage history host ip vpn_ip public_ip load
        # os_icon ram root_indicator status swap
        # time user vi_mode ssh
        #左侧栏目
        POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh os_icon virtualenv context dir vcs status)
        #右侧栏目
        #POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
        #POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
        POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
        #右侧状态栏不和目录在一行，而是和命令在同一行
        #POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
    # }

    #时间格式
        #POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %d.%m.%y}"

    #新起一行显示命令 (推荐！极其方便）
        POWERLEVEL9K_PROMPT_ON_NEWLINE=true

    #添加连接上下连接箭头更方便查看
        POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
        POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
    # }

    #新的命令与上面的命令隔开一行
        #POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

    #缩短目录层级--------{
        POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
        #省略符号：`..`或`-`等
        POWERLEVEL9K_SHORTEN_DELIMITER=".."
        #缩短目录策略：
        #POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
        #POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
    # }

    # 显示目录是否可写
        POWERLEVEL9K_DIR_SHOW_WRITABLE=true
    # }

    #一般图标色彩指定--------{
        POWERLEVEL9K_OS_ICON_BACKGROUND="black"
        POWERLEVEL9K_OS_ICON_FOREGROUND="white"
        POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
        POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
        POWERLEVEL9K_TIME_FOREGROUND="006"
        POWERLEVEL9K_TIME_BACKGROUND="235"
        POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
        POWERLEVEL9K_STATUS_OK_BACKGROUND="236"
    # }

    #Git仓库状态的色彩指定 --------{
        POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
        POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
        POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
        POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
        POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
        POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
        #POWERLEVEL9K_SHOW_CHANGESET=true
    # }

    #Icons图标指定 --------{
        #POWERLEVEL9K_HOME_ICON=''
        #POWERLEVEL9K_HOME_SUB_ICON=''
        #POWERLEVEL9K_FOLDER_ICON=''
    # }

    # Python virtualenv 虚拟环境设定 ---------{
        POWERLEVEL9K_VIRTUALENV_FOREGROUND='green'
        POWERLEVEL9K_VIRTUALENV_BACKGROUND='black'
        POWERLEVEL9K_CUSTOM_VIRTUALENV="red"
    # }
}
