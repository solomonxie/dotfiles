if executable('fzf')
    "let g:fzf_action = {  }
    " This is the default extra key bindings
    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' ,
      \ 'ctrl-e': 'edit' }
    " Default fzf layout
        " down | up | left | right
        let g:fzf_layout = { 'down': '~40%' }
    " [Buffers] Jump to the existing window if possible
        "let g:fzf_buffers_jump = 1
    " [[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    " [Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'
    " [History] -> will block Ctrl-n & Ctrl-p keys
        "let g:fzf_history_dir = '~/.vim/fzf-history'
    " - enew / -tabnew / 10split enew
        "let g:fzf_layout = { 'window': 'enew' }
        "let g:fzf_layout = { 'window': '-tabnew' }
        "let g:fzf_layout = { 'window': '10split enew' }
    " command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--path-to-ignore ~/.ignore --hidden', <bang>0)

    " MUST BE PLACED AFTER SETTINGS
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    if has('nvim')
        Plug 'yuki-ycino/fzf-preview.vim'
    endif
endif
