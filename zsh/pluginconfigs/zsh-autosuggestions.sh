# Fish-like commandline suggestions (not working with oh-my-zsh)

if [ ! -e ~/.zsh_plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh_plugins/zsh-autosuggestions
fi
ZSH_AUTOSUGGEST_STRATEGY=(history )  # history|completion|match_prev_cmd -> `history` is faster
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
ZSH_AUTOSUGGEST_MANUAL_REBIND=true  # Faster
# ZSH_AUTOSUGGEST_USE_ASYNC=true  # Slower
# ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=1000
# ZSH_AUTOSUGGEST_HISTORY_IGNORE=()

# REF: https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh  # 200ms+


# WITHOUT `ZSH_AUTOSUGGEST_MANUAL_REBIND=true` (0.21sec)
# num  calls                time                       self            name
# -----------------------------------------------------------------------------------
#  1) 8786         513.54     0.06   37.67%    511.11     0.06   37.49%  _zsh_autosuggest_bind_widget
#  2)   46         925.12    20.11   67.86%    411.57     8.95   30.19%  _zsh_autosuggest_bind_widgets
#  3)   46         244.11     5.31   17.91%    244.11     5.31   17.91%  _zsh_git_prompt_async_request
#  4)   96          89.01     0.93    6.53%     53.14     0.55    3.90%  _zsh_highlight
#  5)    2          28.59    14.29    2.10%     28.59    14.29    2.10%  compaudit


# WITH `ZSH_AUTOSUGGEST_MANUAL_REBIND=true` (0.13sec)
# num  calls                time                       self            name
# -----------------------------------------------------------------------------------
#  1)    2          31.07    15.54   23.39%     31.07    15.54   23.39%  compaudit
#  2)   22          17.76     0.81   13.37%     17.76     0.81   13.37%  _zsh_highlight_main__type
#  3)  191          16.07     0.08   12.10%     13.37     0.07   10.06%  _zsh_autosuggest_bind_widget
#  4)    1          42.57    42.57   32.04%     11.49    11.49    8.65%  compinit


# WITH `ZSH_AUTOSUGGEST_USE_ASYNC=true` (0.18sec)
# num  calls                time                       self            name
# -----------------------------------------------------------------------------------
#  1)   31         188.05     6.07   41.52%    188.05     6.07   41.52%  _zsh_git_prompt_async_request
#  2)   11          60.57     5.51   13.37%     58.43     5.31   12.90%  _zsh_git_prompt_callback
#  3)   72          82.81     1.15   18.28%     40.71     0.57    8.99%  _zsh_highlight
#  4)    2          27.79    13.90    6.14%     27.79    13.90    6.14%  compaudit
