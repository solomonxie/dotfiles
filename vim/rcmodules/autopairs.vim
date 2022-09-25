" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs' "Smartest (bug:)

" KEY MAPPINGS
"imap <C-d> <Meta>
"imap <C-d>e <M-e>

let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''",'<!--': '-->', '<%': '%>'}
"Fly mode
let g:AutoPairsFlyMode = 1
"Options
let g:AutoPairsMultilineClose = 0 "Solve bug of deleting pair
let g:AutoPairsMapBS = 0  "Disable deleting pairs (inconvenient)
let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 0  "Insert a new indented line (buggy for deeper level)
let g:AutoPairsCenterLine = 0
let g:AutoPairsMapSpace = 0
" let g:AutoPairsShortcutToggle = '<M-i>'  " Default to <M-p>
