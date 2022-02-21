profile start /tmp/vim_profile.log
profile func *
profile file *

augroup PauseProfiling
    autocmd!
    autocmd VimEnter * profile pause
augroup end
