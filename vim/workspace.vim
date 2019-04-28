let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles/vim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 vimrc
badd +12 vimrc-ui
badd +50 vimrc-keymappings
badd +32 vimrc-plugins
argglobal
silent! argdel *
$argadd vimrc
$argadd vimrc-keymappings
$argadd vimrc-plugins
$argadd vimrc-ui
edit vimrc
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
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 42 + 41) / 82)
exe 'vert 1resize ' . ((&columns * 160 + 159) / 318)
exe '2resize ' . ((&lines * 36 + 41) / 82)
exe 'vert 2resize ' . ((&columns * 160 + 159) / 318)
exe '3resize ' . ((&lines * 42 + 41) / 82)
exe 'vert 3resize ' . ((&columns * 157 + 159) / 318)
exe '4resize ' . ((&lines * 36 + 41) / 82)
exe 'vert 4resize ' . ((&columns * 157 + 159) / 318)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=1
setlocal fen
let s:l = 4 - ((3 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 0
wincmd w
argglobal
if bufexists('vimrc-keymappings') | buffer vimrc-keymappings | else | edit vimrc-keymappings | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=1
setlocal fen
let s:l = 6 - ((5 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
6
normal! 066|
wincmd w
argglobal
if bufexists('vimrc-plugins') | buffer vimrc-plugins | else | edit vimrc-plugins | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=1
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists('vimrc-ui') | buffer vimrc-ui | else | edit vimrc-ui | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=1
setlocal fen
let s:l = 12 - ((10 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 0
wincmd w
exe '1resize ' . ((&lines * 42 + 41) / 82)
exe 'vert 1resize ' . ((&columns * 160 + 159) / 318)
exe '2resize ' . ((&lines * 36 + 41) / 82)
exe 'vert 2resize ' . ((&columns * 160 + 159) / 318)
exe '3resize ' . ((&lines * 42 + 41) / 82)
exe 'vert 3resize ' . ((&columns * 157 + 159) / 318)
exe '4resize ' . ((&lines * 36 + 41) / 82)
exe 'vert 4resize ' . ((&columns * 157 + 159) / 318)
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
