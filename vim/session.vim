let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/workspace/appannie/aa-bulk-grabber/webanalytics/tasks/bulk_grabber
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 app_info_grabber.py
badd +66 metric_info_grabber.py
badd +93 metric_info_merger.py
badd +65 dimension_info_grabber.py
badd +8 data_grabbing_conf/cross_app_usage_product_level.py
badd +13 ~/workspace/appannie/aa-bulk-grabber/task_queue_config_local.py
badd +157 data_grabbing_conf/store_product_level.py
badd +153 data_grabbing_conf/usage_product_level_base.py
badd +6 data_grabbing_conf/usage_product_level_professional.py
argglobal
silent! argdel *
edit app_info_grabber.py
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
let s:l = 208 - ((66 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
208
normal! 0
lcd ~/workspace/appannie/aa-bulk-grabber/webanalytics/tasks/bulk_grabber
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
