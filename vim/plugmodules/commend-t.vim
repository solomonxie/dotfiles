if &runtimepath =~ 'command-t'
    let g:CommandTMaxDepth = 10
    let g:CommandTMaxFiles=2000
    let g:CommandTSuppressMaxFilesWarning = 1
    set wildignore+=".*, *.dat, *.o, *.pyc, */.git, *.pdf, *.app, *.jpg, *.png, *.gif, *.doc, *.docx"
endif
