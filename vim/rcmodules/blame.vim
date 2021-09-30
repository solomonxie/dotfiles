"REF: https://github.com/jcartledge/git-blame-nvim
" Plug 'jcartledge/git-blame-nvim'
Plug 'solomonxie/git-blame-nvim', {'branch': 'master'}

let g:git_blame_enabled = 1

nnoremap <Leader>b :call GitBlameToggle()<CR>
