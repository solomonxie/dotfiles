" https://github.com/puremourning/vimspector
" https://www.youtube.com/watch?v=-AZUIL1rY3U&t=12s
Plug 'puremourning/vimspector', {'do': './install_gadget.py --all --force-enable-node'}

" let g:vimspector_enable_mappings='HUMAN'
let g:vimspector_install_gadgets = ['vscode-node-debug2']
" packadd! vimspector

" function! GotoWindow(id)
"   :call win_gotoid(a:id)
" endfun
"
" function! AddToWatch()
"   let word = expand("<cexpr>")
"   call vimspector#AddWatch(word)
" endfunction

" let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
" let g:vimspector_sidebar_width = 60

" nnoremap <leader>da :call vimspector#Launch()<CR>
" nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
" nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
" nnoremap <leader>di :call AddToWatch()<CR>
" nnoremap <leader>dx :call vimspector#Reset()<CR>
" nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
" nnoremap <S-p> :call vimspector#StepOut()<CR>
" nnoremap <S-s> :call vimspector#StepInto()<CR>
" nnoremap <S-n> :call vimspector#StepOver()<CR>
" nnoremap <leader>d_ :call vimspector#Restart()<CR>
" nnoremap <leader>dn :call vimspector#Continue()<CR>
" nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
" nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
" nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
"
" let g:vimspector_sign_priority = {
"   \    'vimspectorBP':         998,
"   \    'vimspectorBPCond':     997,
"   \    'vimspectorBPDisabled': 996,
"   \    'vimspectorPC':         999,
"   \ }
"
" " janko/vim-test and puremourning/vimspector
" nnoremap <leader>dd :TestNearest -strategy=jest<CR>
" function! JestStrategy(cmd)
"   let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
"   call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
" endfunction
" let g:test#custom_strategies = {'jest': function('JestStrategy')}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               INSTALL STEPS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/puremourning/vimspector/issues/88
" If you are using plugin managers like vim-plug, add this line to your init.vim:
" Plug 'puremourning/vimspector'
"
" Run this command:
" :PlugInstall
"
" vimspector now exists in this directory:
" /home/$USER/.config/nvim/plugged/vimspector/
"
" To install gadgets, go to that directory and start installing some gadgets(For instance i installed vscode-cpptools gadget):
" ./install_gadget.py --enable-c
"
" Now go to your project and create a file called .vimspector.json and put these lines into it:


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               NODE.JS CONFIG                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimspector.json
" {
"   "configurations": {
"     "<name>: Launch": {
"       "adapter": "vscode-node",
"       "configuration": {
"         "name": "<name>",
"         "type": "node",
"         "request": "launch",
"         "program": "${workspaceRoot}/debug/neodm",
"         "cwd": "${workspaceRoot}",
"         "externalConsole": true,
"         "stopAtEntry": true
"       }
"     },
"     "<name>: Attach": {
"       "adapter": "vscode-node",
"       "configuration": {
"         "name": "<name>: Attach",
"         "type": "cppdbg",
"         "request": "attach",
"         "program": "${workspaceRoot}/debug/neodm"
"       }
"     }
"   }
" }
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 C++ CONFIG                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimspector.json
" {
"   "configurations": {
"     "<name>: Launch": {
"       "adapter": "vscode-cpptools",
"       "configuration": {
"         "name": "<name>",
"         "type": "cppdbg",
"         "request": "launch",
"         "program": "${workspaceRoot}/debug/neodm",
"         "cwd": "${workspaceRoot}",
"         "externalConsole": true,
"         "stopAtEntry": true,
"         "MIMode": "gdb"
"       }
"     },
"     "<name>: Attach": {
"       "adapter": "vscode-cpptools",
"       "configuration": {
"         "name": "<name>: Attach",
"         "type": "cppdbg",
"         "request": "attach",
"         "program": "${workspaceRoot}/debug/neodm",
"         "MIMode": "gdb"
"       }
"     }
"   }
" }
