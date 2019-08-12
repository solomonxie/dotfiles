let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +21 vim/vimrc.vim
badd +12 vim/vimrc-ui.vim
badd +6 vim/vimrc-keymappings.vim
badd +1 vim/vimrc-plugins.vim
badd +1 ~/vimrc-local.vim
argglobal
silent! argdel *
$argadd vim/vimrc.vim
$argadd vim/vimrc-keymappings.vim
$argadd vim/vimrc-plugins.vim
$argadd vim/vimrc-ui.vim
edit vim/vimrc.vim
set splitbelow splitright
set nosplitbelow
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=1
setlocal fen
let s:l = 21 - ((20 * winheight(0) + 48) / 96)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
21
normal! 0
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
