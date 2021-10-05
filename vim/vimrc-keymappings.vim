"-----------------------------------------------------------------
"           __     ___             _  __                         -
"           \ \   / (_)_ __ ___   | |/ /___ _   _ ___            -
"            \ \ / /| | '_ ` _ \  | ' // _ \ | | / __|           -
"             \ V / | | | | | | | | . \  __/ |_| \__ \           -
"              \_/  |_|_| |_| |_| |_|\_\___|\__, |___/           -
"                                           |___/                -
"----------------------------GENERATED-BY-FIGLET------------------
" DEBUG TIPS
" > :verbose imap "

" Get Full path of ~, e.g., /home/ubuntu
let $HOME = expand('~')
let $DOTFILES = expand('~') . '/myconf/dotfiles'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          GENERAL GLOBAL MAPPINGS                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
" let maplocalleader = "\\"

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set shortmess+=c

" When menu comes out, can use ctrl-n to select
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  ALPHABET                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap br "1y:bufdo %s/<C-r>1/<C-r>1/ge \| update
nnoremap fw /<C-r>+<CR>

" Centralize
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap J mzJ`z

" nnoremap Mp [m
" nnoremap Mn ]m

" nnoremap gx :silent execute "!open <c-r><c-a>"<CR>
nnoremap gx :call OpenLink("<C-r><C-a>")<CR>
vnoremap g* "1y:%s/<C-r>1//n<CR>
" Refer: https://vim.fandom.com/wiki/Count_number_of_matches_of_a_pattern
nnoremap g* #<C-O>:%s///gn<CR>

vnoremap r "1y:%s/<C-r>1/<C-r>1/gc<Left><Left><Left>*<BS>
vnoremap f "1y :Rg <C-r>1<CR>

nnoremap Y y$


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             SPECIAL CHARACTERS                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No Use of ";" in Normal mode
" nnoremap ; :

" Break undo sequence:
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
" inoremap <Space> <Space><C-g>u

" Buffer Movement
nnoremap - :bprev<CR>:echo expand('%')<CR>
nnoremap = :bnext<CR>:echo expand('%')<CR>

" ESC replacement
inoremap ,. <Esc>:nohl<CR><ESC>
vnoremap ,. <Esc>:nohl<CR><ESC>
nnoremap ,. <Esc>:nohl<CR><ESC>
cnoremap ,. <ESC>

" Word Selection
nnoremap <Space> viw
nnoremap v<Space> viW

" Highlight
nnoremap  / :set hlsearch<cr>/
nnoremap  ? :set hlsearch<cr>?
nnoremap  * #:set hlsearch<cr>
nnoremap  # *:set hlsearch<cr>
nnoremap  !! /<C-r>+<CR>

vnoremap <CR> "+y

nnoremap <Del> <ESC>:nohl<CR><ESC>
vnoremap <Del> <ESC>:nohl<CR><ESC>
inoremap <Del> <ESC>
onoremap <Del> <ESC>
cnoremap <Del> <ESC>
tnoremap <Del> <ESC>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            LEADER KEY MAPPINGS                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <leader>r "1y:1,10 s/<C-r>1/<C-r>1/gc<Left><Left><Left>*<BS>
nnoremap <Leader>v v$h
nnoremap <Leader>0 v^

vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p

"Git blame current line
nnoremap gb :execute "!git blame -L " . line(".") . ",+1 % "<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          CTRL + ALPHABET MAPPINGS                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-v> <C-r>0
noremap  <C-c> <Esc>:nohl<CR><ESC>
nnoremap <ESC> <Esc>:nohl<CR><ESC>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ALT + ALPHABET MAPPINGS                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



nnoremap t1 :call JumpToBuffer(0)<CR>
nnoremap t2 :call JumpToBuffer(1)<CR>
nnoremap t3 :call JumpToBuffer(2)<CR>
nnoremap t4 :call JumpToBuffer(3)<CR>
nnoremap t5 :call JumpToBuffer(4)<CR>
nnoremap t6 :call JumpToBuffer(5)<CR>
nnoremap t7 :call JumpToBuffer(6)<CR>
nnoremap t8 :call JumpToBuffer(7)<CR>
nnoremap t9 :call JumpToBuffer(8)<CR>
nnoremap t0 :call JumpToBuffer(-1)<CR>

nnoremap ]b :call searchpair('\[','','\]')<cr>
nnoremap [b :call searchpair('\[','','\]','b')<cr>
nnoremap ]B :call searchpair('{','','}')<cr>
nnoremap [B :call searchpair('{','','}','b')<cr>


nnoremap \ `
nnoremap <leader>l :call ToggleRelativeNumber()<CR>

" vnoremap <Leader>f "1y:call GrepOpen("<C-r>1")<CR>
nnoremap <Leader>aa :ggVG<CR>
nnoremap <Leader>ay :%y+<CR>
nnoremap <Leader>ad :%d+<CR>

noremap <Leader>s :vsplit<CR><C-w>l
noremap <Leader>q :bdelete<CR><ESC>
nnoremap <Leader>tc :tabnew<CR>
nnoremap <Leader>tq :windo bdelete<CR>

noremap <A-c> <C-w>c

nnoremap \\ :echo expand('%')<CR>
nnoremap tf :Cwd<CR>
nnoremap tc :CwdCopy<CR>
nnoremap tp :PwdCopy<CR>
nnoremap tn :FilenameCopy<CR>

augroup FileCompile
    autocmd!
    autocmd BufReadPre *.py noremap <buffer> <leader>B :w<CR>:!python "%:p" <CR>
    autocmd BufReadPre *.c noremap <buffer> <leader>B :w<CR>:!gcc % -o /tmp/a.out && /tmp/a.out <CR>
    autocmd BufReadPre *.cpp,*.cc noremap <buffer> <leader>B :w<CR>:!g++ % -o /tmp/a.out && /tmp/a.out <CR>
    autocmd BufReadPre *.js noremap <buffer> <leader>B :w<CR>:call DebugCurrentFile()<CR>
    " autocmd BufReadPre *.js nnoremap <buffer> [[ []
    " autocmd BufReadPre *.js nnoremap <buffer> ]] ][
    autocmd BufReadPre *.sh noremap <buffer> <leader>B :w<CR>:!bash % <CR>
    autocmd BufReadPre Makefile noremap <buffer> <leader>B :w<CR>:!make <CR>
    autocmd BufReadPre .vim,.vimrc,vimrc* noremap <buffer> <leader>B :w<CR>:source ~/.vim/init.vim <CR>
    autocmd BufReadPre .zshrc,zshrc* noremap <buffer> <leader>B :w<CR>:!source % <CR>
augroup end

if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif
