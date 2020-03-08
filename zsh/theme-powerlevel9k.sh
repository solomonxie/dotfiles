#######################################################################
#                        THEME - POWERLEVEL9K                         #
#######################################################################

# Preload dependencies:
    if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
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

