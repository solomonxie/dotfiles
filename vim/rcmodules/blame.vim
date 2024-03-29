"REF: https://github.com/jcartledge/git-blame-nvim
" Plug 'jcartledge/git-blame-nvim'

"REF: https://github.com/solomonxie/git-blame-nvim
Plug 'solomonxie/git-blame-nvim', {'branch': 'dev'}  "Fork & modified

let g:git_blame_enabled = 0
highlight! GitBlameTextStyle ctermfg=249 ctermbg=237

nnoremap <Leader>b :call GitBlameToggle()<CR>
