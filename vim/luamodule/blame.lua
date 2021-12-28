--REF: https://github.com/jcartledge/git-blame-nvim
-- use 'jcartledge/git-blame-nvim'

--REF: https://github.com/solomonxie/git-blame-nvim
use 'solomonxie/git-blame-nvim', {'branch': 'dev'}

let g:git_blame_enabled = 0
highlight! GitBlameTextStyle ctermfg=249

nnoremap <Leader>b :call GitBlameToggle()<CR>
