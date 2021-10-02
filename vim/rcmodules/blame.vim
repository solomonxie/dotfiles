"REF: https://github.com/jcartledge/git-blame-nvim
" Plug 'jcartledge/git-blame-nvim'

"REF: https://github.com/solomonxie/git-blame-nvim
Plug 'solomonxie/git-blame-nvim', {'branch': 'master'}  "Fork & modified

let g:git_blame_enabled = 0

nnoremap <Leader>b :call GitBlameToggle()<CR>
