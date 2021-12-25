--REF: https://github.com/ap/vim-buftabline
use 'ap/vim-buftabline'

--let g:buftabline_show = 1  --only if there are at least two buffers
--let g:buftabline_numbers = 2
--let g:buftabline_indicators = v:true
--let g:buftabline_separators = v:false
----let g:buftabline_plug_max = 10
--let g:buftabline_indicators = v:true

---- REF: CTERM COLOR PICKER ==> https://jonasjacek.github.io/colors/
----highlight XXX cterm=NONE ctermbg=15 ctermfg=8 gui=NONE guibg=#ffffff guifg=#d70000

---- ==> airline-theme: 'wombat'
---- REF: https://gist.github.com/iboard/5853434
---- REF: https://jonasjacek.github.io/colors/
--highlight BufTabLineCurrent ctermbg=192 ctermfg=0
--highlight BufTabLineHidden ctermbg=235 ctermfg=191
--highlight BufTabLineModifiedCurrent ctermfg=0 ctermbg=168
--highlight BufTabLineModifiedActive ctermfg=0 ctermbg=214
--highlight BufTabLineModifiedHidden ctermfg=0 ctermbg=222

---- DEFAULT
----hi default link BufTabLineCurrent TabLineSel
----hi default link BufTabLineActive PmenuSel
----hi default link BufTabLineHidden TabLine
----hi default link BufTabLineFill TabLineFill
----hi default link BufTabLineModifiedCurrent BufTabLineCurrent
----hi default link BufTabLineModifiedActive BufTabLineActive
----hi default link BufTabLineModifiedHidden BufTabLineHidden
