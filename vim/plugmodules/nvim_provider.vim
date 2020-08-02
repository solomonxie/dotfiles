""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              NEOVIM PROVIDERS                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

":checkhealth provider

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   PYTHON                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default
let g:loaded_python_provider = 0
let g:python3_host_prog = '~/dotfiles/.git/venv3/bin/python'
let g:python_host_prog = '~/dotfiles/.git/venv2/bin/python'


"Override by project
let projectroot = trim(system("git rev-parse --show-toplevel"))
let py2_link = projectroot . '/.git/py2'
let py3_link = projectroot . '/.git/py3'
let use_py2 = filereadable(py2_link)
let use_py3 = filereadable(py3_link)
if use_py2
    let g:loaded_python_provider = 1
    let pylink = py2_link
    if executable(pylink)
        let g:python_host_prog = trim(system("readlink -f " . pylink))
    else
        let projectvenv = projectroot . '/.git/venv2'
        let pylink = trim(system("readlink -f " . projectvenv . '/bin/python'))
        if !executable(pylink)
            echo 'creating python virtualenv to ' . projectvenv
            echo system('virtualenv -p python2 ' . projectvenv)
            echo system(pylink . ' -m pip install pynvim neovim jedi')
        endif
        let g:python_host_prog = pylink
    endif
    echo 'Use Python: ' . pylink
elseif use_py3
    let g:loaded_python_provider = 0
    let pylink = py3_link
    if executable(pylink)
        let g:python3_host_prog = trim(system("readlink -f " . pylink))
    else
        let projectvenv = projectroot . '/.git/venv3'
        let pylink = trim(system("readlink -f " . projectvenv . '/bin/python'))
        if !executable(pylink)
            echo 'creating python virtualenv to ' . projectvenv
            echo system('virtualenv -p python3 ' . projectvenv)
            echo system(pylink . ' -m pip install pynvim neovim jedi')
        endif
        let g:python3_host_prog = pylink
    endif
    echo 'Use Python: ' . pylink
endif
