ZIM_HOME=~/.zsh_plugins/zim
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
    git clone https://github.com/zimfw/zimfw.git ${ZIM_HOME}
    source ${ZIM_HOME}/zimfw.zsh init -q
fi

if [[ ! -e ~/.zimrc ]]; then
    touch ~/.zimrc
fi

zstyle ':zim:zmodule' use 'degit'
source ${ZIM_HOME}/init.zsh
