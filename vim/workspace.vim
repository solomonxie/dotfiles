let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles/vim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +25 ~/dotfiles/vim/vimrc
badd +9 ~/dotfiles/vim/vimrc-ui
badd +1 ~/dotfiles/vim/vimrc-keymappings
badd +1 ~/dotfiles/vim/vimrc-plugins
argglobal
silent! argdel *
$argadd vimrc
$argadd vimrc-keymappings
$argadd vimrc-plugins
$argadd vimrc-ui
edit ~/dotfiles/vim/vimrc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
wincmd t
set winminheight=1 winminwidth=1 winheight=1 winwidth=1
exe '1resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 1resize ' . ((&columns * 91 + 85) / 170)
exe '2resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 2resize ' . ((&columns * 91 + 85) / 170)
exe '3resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 3resize ' . ((&columns * 78 + 85) / 170)
exe '4resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 4resize ' . ((&columns * 78 + 85) / 170)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=1
setlocal fen
let s:l = 10 - ((9 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 048|
wincmd w
argglobal
if bufexists('~/dotfiles/vim/vimrc-plugins') | buffer ~/dotfiles/vim/vimrc-plugins | else | edit ~/dotfiles/vim/vimrc-plugins | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=1
setlocal fen
let s:l = 5 - ((4 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 028|
wincmd w
argglobal
if bufexists('~/dotfiles/vim/vimrc-ui') | buffer ~/dotfiles/vim/vimrc-ui | else | edit ~/dotfiles/vim/vimrc-ui | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=1
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists('~/dotfiles/vim/vimrc-keymappings') | buffer ~/dotfiles/vim/vimrc-keymappings | else | edit ~/dotfiles/vim/vimrc-keymappings | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=1
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe '1resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 1resize ' . ((&columns * 91 + 85) / 170)
exe '2resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 2resize ' . ((&columns * 91 + 85) / 170)
exe '3resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 3resize ' . ((&columns * 78 + 85) / 170)
exe '4resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 4resize ' . ((&columns * 78 + 85) / 170)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
