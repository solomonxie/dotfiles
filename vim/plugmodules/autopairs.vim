" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs' "Smartest (bug:)

let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
"Fly mode
let g:AutoPairsFlyMode = 0
"Options
let g:AutoPairsMultilineClose = 0 "Solve bug of deleting pair
"let g:AutoPairsMapBS = 0
"let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 0  "Has bug for nested level
"let g:AutoPairsCenterLine = 0
"let g:AutoPairsMapSpace = 0
let g:AutoPairsShortcutToggle = '<M-i>'  " Default to <M-p>
