""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              NEOVIM PROVIDERS                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Py2
let g:loaded_python_provider = 0  "Disable Py2 provider
" let g:python_host_prog = trim(system("which python2"))

"Py3
" let g:loaded_python3_provider = 1
let gitroot = trim(system("git rev-parse --show-toplevel"))
let py3_link = gitroot . '/.git/python3_symblink'
if filereadable(py3_link)
    let g:python3_host_prog = trim(system("readlink -f " . py3_link))
    echo 'Using python interpreter from: ' . g:python3_host_prog
else
    let g:python3_host_prog = trim(system("which python3"))
endif

" let exe_path = provider#python3#Prog()
" system(exe_path . ' -m pip install neovim pynvim jedi')
