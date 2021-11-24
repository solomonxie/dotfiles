if &runtimepath =~ 'deoplete'
    " REF (Bug): https://github.com/carlitux/deoplete-ternjs/issues/88#issuecomment-713913170
    call deoplete#custom#option('num_processes', 4)
endif


lua << EOF

EOF
