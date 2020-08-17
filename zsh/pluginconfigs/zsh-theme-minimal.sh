# https://github.com/subnixr/minimal
if [ ! -e ~/.zsh/plugins/minimal ]; then
    git clone https://github.com/subnixr/minimal.git ~/.zsh/plugins/minimal
fi

MNML_PROMPT=(mnml_git 'mnml_cwd 2 0' mnml_jobs mnml_err mnml_status )
MNML_RPROMPT=()
MNML_INFOLN=()
MNML_MAGICENTER=()
MNML_USER_CHAR='➜ '
MNML_NOMRAL_CHAR='-'
MNML_INSERT_CHAR='>'

#######################################################################
#                           KEEP AT BOTTOM                            #
#######################################################################
source ~/.zsh/plugins/minimal/minimal.zsh
