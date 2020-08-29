" https://github.com/ludovicchabant/vim-gutentags
" MEMO:
"   1. put `.notags` at root of project path to disable
"   2. let g:gutentags_enabled = 0 to disable
"   2. :GutentagsToggleEnabled<CR> to enable/disable plugin
if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags' "Manage tags (auto)

    " Searching fields (recursively searching from bottom up)
    let g:gutentags_project_root = ['Makefile', '.git', '.root', '.svn', '.project']
    " Ignore some specifi projects
    " let g:gutentags_exclude_project_root = ['~/workspace/']
    " Tag filename
    let g:gutentags_ctags_tagfile = 'tags'
    " List files method (critical to speed)
    if executable('git') && isdirectory('.git')
        let g:gutentags_file_list_command = 'git ls-files'
    elseif executable('rg')
        let g:gutentags_file_list_command = 'rg --files'
    " elseif executable('ag')
    "     let g:gutentags_file_list_command = 'ag -l'
    else
        let g:gutentags_file_list_command = 'find . -type f'
    endif
    let g:gutentags_exclude_filetypes = ['js', 'sql', 'tmpl', 'sh', 'json', 'csv', 'txt', 'xml', 'html', 'gz', 'xls', 'doc']
    let g:gutentags_ctags_exclude = ['.git']
    let g:gutentags_generate_on_empty_buffer = 0
    " Tag files store place, instead of project dirs
    " let s:vim_tags = expand('~/.vim/tags')
    let s:vim_tags = '.git/ctags'
    let g:gutentags_cache_dir = s:vim_tags
    " Create tag dir if not exists
    if !isdirectory(s:vim_tags)
       silent! call mkdir(s:vim_tags, 'p')
    endif
    " Ctag command flags
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--python-kinds=-i']
endif
