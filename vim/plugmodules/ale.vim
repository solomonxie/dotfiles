" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

if &runtimepath =~ 'ale'
    let g:ale_fix_on_save = 0
    let b:ale_warn_about_trailing_whitespace = 0
    let g:ale_sign_error = 'E'
    let g:ale_sign_warning = 'W'
    " let b:ale_linters = {'python': ['bandit']}
    " let b:ale_fixers = {
    " \   'python': ['autopep8'],
    " \   'c++': ['clang', 'gcc']
    " \}
endif
