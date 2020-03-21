let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 vim/plugged/vim-snippets/snippets/_.snippets
badd +1 vim/plugged/vim-snippets/snippets/arduino.snippets
badd +1 vim/plugged/vim-snippets/snippets/awk.snippets
badd +1 vim/plugged/vim-snippets/snippets/c.snippets
badd +1 vim/plugged/vim-snippets/snippets/cmake.snippets
badd +1 vim/plugged/vim-snippets/snippets/cpp.snippets
badd +1 vim/plugged/vim-snippets/snippets/css.snippets
badd +1 vim/plugged/vim-snippets/snippets/dart.snippets
badd +1 vim/plugged/vim-snippets/snippets/diff.snippets
badd +1 vim/plugged/vim-snippets/snippets/django.snippets
badd +1 vim/plugged/vim-snippets/snippets/go.snippets
badd +1 vim/plugged/vim-snippets/snippets/haml.snippets
badd +1 vim/plugged/vim-snippets/snippets/haskell.snippets
badd +1 vim/plugged/vim-snippets/snippets/html.snippets
badd +1 vim/plugged/vim-snippets/snippets/htmldjango.snippets
badd +1 vim/plugged/vim-snippets/snippets/htmltornado.snippets
badd +1 vim/plugged/vim-snippets/snippets/java.snippets
badd +1 vim/plugged/vim-snippets/snippets/javascript-bemjson.snippets
badd +1 vim/plugged/vim-snippets/snippets/javascript-d3.snippets
badd +1 vim/plugged/vim-snippets/snippets/javascript-es6-react.snippets
badd +1 vim/plugged/vim-snippets/snippets/javascript-mocha.snippets
badd +1 vim/plugged/vim-snippets/snippets/javascript-openui5.snippets
badd +1 vim/plugged/vim-snippets/snippets/jenkins.snippets
badd +1 vim/plugged/vim-snippets/snippets/jinja.snippets
badd +1 vim/plugged/vim-snippets/snippets/kotlin.snippets
badd +1 vim/plugged/vim-snippets/snippets/liquid.snippets
badd +1 vim/plugged/vim-snippets/snippets/ls.snippets
badd +1 vim/plugged/vim-snippets/snippets/lua.snippets
badd +1 vim/plugged/vim-snippets/snippets/make.snippets
badd +1 vim/plugged/vim-snippets/snippets/objc.snippets
badd +1 vim/plugged/vim-snippets/snippets/perl.snippets
badd +1 vim/plugged/vim-snippets/snippets/perl6.snippets
badd +1 vim/plugged/vim-snippets/snippets/php.snippets
badd +1 vim/plugged/vim-snippets/snippets/po.snippets
badd +1 vim/plugged/vim-snippets/snippets/python.snippets
badd +1 vim/plugged/vim-snippets/snippets/r.snippets
badd +1 vim/plugged/vim-snippets/snippets/racket.snippets
badd +1 vim/plugged/vim-snippets/snippets/rst.snippets
badd +1 vim/plugged/vim-snippets/snippets/ruby.snippets
badd +1 vim/plugged/vim-snippets/snippets/rust.snippets
badd +1 vim/plugged/vim-snippets/snippets/sass.snippets
badd +1 vim/plugged/vim-snippets/snippets/scala.snippets
badd +1 vim/plugged/vim-snippets/snippets/scss.snippets
badd +1 vim/plugged/vim-snippets/snippets/sh.snippets
badd +1 vim/plugged/vim-snippets/snippets/snippets.snippets
badd +1 vim/plugged/vim-snippets/snippets/sql.snippets
badd +1 vim/plugged/vim-snippets/snippets/textile.snippets
badd +1 vim/plugged/vim-snippets/snippets/typescript.snippets
badd +1 vim/plugged/vim-snippets/snippets/typescriptreact.snippets
badd +1 vim/plugged/vim-snippets/snippets/vim.snippets
badd +1 vim/plugged/vim-snippets/snippets/vue.snippets
badd +1 vim/plugged/vim-snippets/snippets/zsh.snippets
badd +10 vim/plugged/vim-snippets/UltiSnips/snippets.snippets
badd +12 vim/plugged/vim-snippets/UltiSnips/all.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/c.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/cpp.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/css.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/django.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/go.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/html.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/html_minimal.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/htmldjango.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/java.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/javascript-jsdoc.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/javascript-node.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/javascript.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/jinja2.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/json.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/markdown.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/objc.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/php-laravel.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/php-phpspec.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/php-symfony2.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/php.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/python.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/r.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/rst.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/ruby.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/rust.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/sh.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/supercollider.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/tex.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/texmath.snippets
badd +1 vim/plugged/vim-snippets/UltiSnips/vim.snippets
argglobal
%argdel
$argadd vim/plugged/vim-snippets/UltiSnips/README
$argadd vim/plugged/vim-snippets/UltiSnips/ada.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/all.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/bib.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/bindzone.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/blade.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/c.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/coffee-jasmine.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/coffee-react.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/coffee.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/cpp.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/crystal.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/cs.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/css.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/cuda.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/d.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/django.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/eelixir.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/elm.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/erlang.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/eruby.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/go.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/haskell.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/help.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/html.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/html_minimal.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/htmldjango.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/htmljinja.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/java.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/javascript-angular.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/javascript-ember.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/javascript-jasmine-arrow.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/javascript-jsdoc.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/javascript-node.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/javascript.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/jinja2.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/json.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/julia.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/ledger.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/lhaskell.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/lua.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/mako.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/markdown.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/matlab.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/objc.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/ocaml.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/octave.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/pandoc.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/perl.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/php-laravel.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/php-phpspec.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/php-symfony2.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/php.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/plsql.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/proto.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/puppet.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/python.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/r.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/rails.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/rnoweb.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/robot.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/rst.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/ruby.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/rust.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/sh.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/snippets.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/soy.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/supercollider.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/tcl.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/tex.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/texmath.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/typescript.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/vim.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/vue.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/xhtml.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/xml.snippets
$argadd vim/plugged/vim-snippets/UltiSnips/zsh.snippets
edit vim/plugged/vim-snippets/snippets/_.snippets
set splitbelow splitright
set nosplitbelow
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
if bufexists("vim/plugged/vim-snippets/snippets/_.snippets") | buffer vim/plugged/vim-snippets/snippets/_.snippets | else | edit vim/plugged/vim-snippets/snippets/_.snippets | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 1 - ((0 * winheight(0) + 34) / 68)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
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
