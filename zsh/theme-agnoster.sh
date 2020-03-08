#######################################################################
#                          THEME - Agnoster                           #
#######################################################################
# Preload dependencies:
    if [ ! -d ~/.oh-my-zsh/themes/agnoster.zsh-theme ]; then
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
