#REF: https://github.com/marlonrichert/zsh-autocomplete
if [ ! -e ~/.zsh_plugins/zsh-autocomplete ];then
    git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh_plugins/zsh-autocomplete
fi
source ~/.zsh_plugins/zsh-autocomplete/zsh-autocomplete.zsh
# zstyle ':autocomplete:*:no-matches-yet' message ''  # Disable idle message
# zstyle ':autocomplete:space:*' magic correct-word expand-history
# zstyle ':autocomplete:tab:*' completion cycle
# zstyle ':autocomplete:*' fuzzy-search off



# DEFAULT PERF (1.1sec)
# num  calls                time                       self            name
# -----------------------------------------------------------------------------------
#  1)    1        1317.21  1317.21   36.18%   1306.32  1306.32   35.88%  fzf-history-widget
#  2)   88         556.95     6.33   15.30%    536.43     6.10   14.74%  _autocomplete.async-list-choices
#  3)   41         273.91     6.68    7.52%    273.91     6.68    7.52%  _zsh_git_prompt_async_request
#  4)  805         262.51     0.33    7.21%    183.71     0.23    5.05%  _description
#  5)   89         735.63     8.27   20.21%    150.51     1.69    4.13%  _autocomplete.list-choices.hook
#  6)   43         972.48    22.62   26.71%    141.19     3.28    3.88%  _autocomplete.async_callback
#  7)  210         227.21     1.08    6.24%    112.48     0.54    3.09%  _zsh_highlight
#  8)  205         176.13     0.86    4.84%    109.86     0.54    3.02%  _all_labels
#  9)  116         187.12     1.61    5.14%     88.92     0.77    2.44%  _parameters
# 10)  850          83.63     0.10    2.30%     83.63     0.10    2.30%  _setup
# 11)   29         569.26    19.63   15.64%     59.04     2.04    1.62%  _alternative
# 12)    9          53.37     5.93    1.47%     51.56     5.73    1.42%  _zsh_git_prompt_callback
# 13)   42         765.54    18.23   21.03%     39.60     0.94    1.09%  _autocomplete._main_complete
# 14)  125          76.33     0.61    2.10%     36.03     0.29    0.99%  _zsh_highlight_main_highlighter_highlight_list
# 15)  620         139.23     0.22    3.82%     31.49     0.05    0.86%  _next_label
# 16)  629          29.57     0.05    0.81%     29.57     0.05    0.81%  _tags
# 17)    2          28.10    14.05    0.77%     28.10    14.05    0.77%  compaudit
