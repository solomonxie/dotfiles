""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              NEOVIM PROVIDERS                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Py2
let g:loaded_python_provider = 0  "Disable Py2 provider

"Py3
if filereadable('.git/python3_host_prog_symblink')
    " let g:python3_host_prog = system('which python3')
    let g:python3_host_prog = expand('~/virtualenv/venv3/bin/python3')
    " let g:jedi#force_py_version=3.7

endif
let exe_path = provider#python3#Prog()
system(exe_path . ' -m pip install neovim pynvim jedi')
