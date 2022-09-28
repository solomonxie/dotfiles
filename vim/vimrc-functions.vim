"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       __     ___              _____                 _   _                       "
"       \ \   / (_)_ __ ___    |  ___|   _ _ __   ___| |_(_) ___  _ __  ___       "
"        \ \ / /| | '_ ` _ \   | |_ | | | | '_ \ / __| __| |/ _ \| '_ \/ __|      "
"         \ V / | | | | | | |  |  _|| |_| | | | | (__| |_| | (_) | | | \__ \      "
"          \_/  |_|_| |_| |_|  |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/      "
"                                                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Hello_word()
    let my_grouped_opts = input ( "1.- Search one\n2.- Search two\n3.- Search three\n" )
    let my_list_opts = split( my_grouped_opts, ".\zs" )
    for selection in my_list_opts
        echo "\nOption number " selection " selected"
    endfor
endfunction


function! JumpToBuffer(...)
    let bufindex = a:1
    let buffer_list = filter(range(1, bufnr("$")), "buflisted(v:val)")
    " echo buffer_list
    exe ":buffer " . buffer_list[bufindex]
endfunction


function! HowManyBuffers()
    let buffer_list = filter(range(1, bufnr("$")), "buflisted(v:val)")
    echo 'There are [' . len(buffer_list) . '] buffers'
endfunction


" Open git changed files
function! EditChangedFiles()
    let fnames = split(system("git diff --name-only"), "\n")
    for fn in fnames
        " execute "argadd " fn
        execute "next " fn
    endfor
endfunction


"{Toggle Relative Line Number}
function! ToggleRelativeNumber()
    if &relativenumber == 0
        set number relativenumber
    else
        set number norelativenumber
    endif
endfunction


function! LoadVimrc()
    :tabnew
    :source ~/dotfiles/vim/workspace.vim
endfunction


function! GetGitRemoteCodeReferenceLink()
    "Expected URL
        "https://git.appannie.org/thecompany/myrepo/blob/master/path/to/script.py#L13"
    "Formatted string
        "https://${REPO}/blob/${BRANCH}/${FILEPATH}#{LINE-NUMBER}"
    let repo = trim(system("git remote get-url origin | sed \"s/^git@//; s/\.git$//\""))
    let branch = trim(system("git rev-parse --abbrev-ref HEAD"))
    let cwd = expand("%")
    let lineno = line(".")
    let url = "https://".repo."/blob/".branch."/".cwd."#L".lineno
    let @+ = url
    echo "Copied: " url
endfunction


function! GetSessionPath()
    let g:gitroot = get(g:, 'gitroot', trim(system("git rev-parse --show-toplevel")))
    if isdirectory(g:gitroot)
        let session_path = g:gitroot . "/.git/workspace.vim"
    else
        let session_path = "/tmp/lastsession.vim"
    endif
    return session_path
endfunction


" function! SaveSessionBuiltIn()
function! SaveSession()
    let session_path = GetSessionPath()
    execute "mksession! " . session_path
    echo "Saved session to: " . session_path
endfunction


function! SaveSessionSimple()
    echom "SAVING SESSION BY FILES..."
    let buffer_list = filter(range(1, bufnr("$")), "buflisted(v:val)")
    " echom 'Buffers: ' . string(buffer_list)
    let session_path = GetSessionPath()
    let steps = []
    call add(steps, 'cd '. expand(getcwd()))
    call add(steps, 'let g:gitroot = "'. g:gitroot . '"')
    call add(steps, 'let s:wipebuf = bufnr("%")')  "Mark initial/empty buffer
    for bn in buffer_list
        call add(steps, '$argadd ' . expand('#' . bn . ':b'))
    endfor
    call add(steps, 'edit ' . expand('#'. bufnr('%') .':b'))  "Set focused file
    call add(steps, 'silent exe "bwipe " . s:wipebuf')  "Remove initial/empty buffer
    " echom 'Steps: ' . string(steps)
    if len(steps) > 0
        call writefile(steps, session_path, 'b')
    endif
    echom "SAVED SESSION TO: " . session_path
endfunction


function! LoadSession()
    let session_path = GetSessionPath()
    execute "source " . session_path
    echom "LOADED SESSION FROM: " . session_path
endfunction


function! OpenFileInPrevWindow()
    "Refer: https://unix.stackexchange.com/questions/74571
    let cfile = expand(expand("<cfile>"))
    if filereadable(cfile)
        wincmd p
        execute "edit " . cfile
    endif
endfunction


"Search/grep pattern and open files
function! GrepOpen(...)
    let keywords = a:1
    let path = "."
    echo "searching [" . keywords . "]..."
    if executable("ag")
        let cmd = "ag -l '" . keywords . "' ". path
    else
        let cmd = "grep -l -r -E '" . keywords . "' " . path
    endif
    let result = trim(system(cmd))
    echo "Search result:\n" . result . "\n\n"
    let target_files = split(result, "\n")
    let choice = input("Open above [". len(target_files) ."] files? (Y/N):")
    if choice == 'y' || choice == 'Y'
        for fname in target_files
            execute "edit " . fname
        endfor
    endif
endfunction


function! UpdatePlugins()
    echo system('pip install --user --upgrade pynvim')
    echo system('pip install --user --upgrade msgpack')
endfunction


function! DebugCurrentFile()
    " https://marketplace.visualstudio.com/items?itemName=fabiospampinato.vscode-debug-launcher
    " - https://github.com/fabiospampinato/vscode-debug-launcher/blob/master/docs/terminal.md
    " REQUIRES:
    " 1. MACOS
    " 2. VSCODE + DEBUG LAUNCHER (EXTENSION)
    let file_path = expand('%:p')
    let cmd = "open 'vscode://fabiospampinato.vscode-debug-launcher/file?args=". file_path ."'"
    echo system(cmd)
endfunction

" REF: https://gist.github.com/JoshuaJWilborn/e8c14b8fabaca3e18178c69f556d30cf
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


function! OpenLink(...)
    let link = a:1
    let url = substitute(link, '\#', '\\#', 'g')
    let cmd = "open " . url
    echo system(cmd)
endfunction


function! EscapeString(...)
    let text = a:1
    let text = substitute(text, '\\', '\\\\', 'g')
    let text = substitute(text, '\/', '\\/', 'g')
    let text = substitute(text, '\~', '\\~', 'g')
    let text = substitute(text, '\[', '\\[', 'g')
    let text = substitute(text, '\]', '\\]', 'g')
    " let text = substitute(text, '\#', '\\#', 'g')
    " let text = substitute(text, '\@', '\\@', 'g')
    return text
endfunction

function! GetVisualSelection()
    "REF: https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! ReplaceSelection()
    "Test: /path/to/abc/def/hah
    "Test: abc~!@#$%%^&&**()
    let l:src = GetVisualSelection()
    let l:src2 = EscapeString(l:src)
    let l:dest = input("Alternative ----> ", l:src)
    let l:dest2 = EscapeString(l:dest)
    if index(['y', 'Y'], input('All buffers? [Yy/Nn]: ', 'n')) >= 0
        let l:bufs = ' bufdo '
    else
        let l:bufs = ''
    endif
    let l:cmd = 'silent! '. l:bufs .' %s#' . l:src2 . '#' . l:dest2 . '#gc'
    if index(['y', 'Y'], input(l:cmd . ' ----> [Yy/Nn]: ', 'y')) >= 0
        let l:buf = bufnr('%')  "Remember current buffer
        " Add to command history
        call histadd("cmd", l:cmd)
        " execute l:cmd
        call feedkeys(':'. l:cmd, 'i')
        " Return to the remembered buffer:
        execute 'buffer ' . l:buf
    else
        echo "\n^Canceled"
    endif
endfunction


function! ToggleVerbose()
    " $ tail -f /tmp/vim-runtime.log
    " $ less +F /tmp/vim-runtime.log
    " When bigger than zero, Vim will give messages about what it is doing. Currently, these messages are given:
    " >= 1 When the viminfo file is read or written.
    " >= 2 When a file is ":source"'ed.
    " >= 5 Every searched tags file and include file.
    " >= 8 Files for which a group of autocommands is executed.
    " >= 9 Every executed autocommand.
    " >= 12 Every executed function.
    " >= 13 When an exception is thrown, caught, finished, or discarded.
    " >= 14 Anything pending in a ":finally" clause.
    " >= 15 Every executed Ex command (truncated at 200 characters).
    if !&verbose
        set verbosefile=/tmp/vim-runtime.log
        set verbose=9
    else
        set verbose=0
        set verbosefile=
    endif
endfunction


function! ShowHighlightGroupUnderCursor ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction


function! ChangeCwdToProjectRoot ()
    let s:cwd = expand('%:p')
    echo s:cwd
    " TBD
    " ...
endfunction


function! BuildCurrentFile ()
    " autocmd BufReadPre *.py noremap <buffer> <leader>B :w<CR>:!python "%:p" <CR>
    " autocmd BufReadPre *.c noremap <buffer> <leader>B :w<CR>:!gcc % -o /tmp/a.out && /tmp/a.out <CR>
    " autocmd BufReadPre *.cpp,*.cc noremap <buffer> <leader>B :w<CR>:!g++ % -o /tmp/a.out && /tmp/a.out <CR>
    " autocmd BufReadPre *.js noremap <buffer> <leader>B :w<CR>:call DebugCurrentFile()<CR>
    " " autocmd BufReadPre *.js nnoremap <buffer> [[ []
    " " autocmd BufReadPre *.js nnoremap <buffer> ]] ][
    " autocmd BufReadPre *.sh noremap <buffer> <leader>B :w<CR>:!bash % <CR>
    " autocmd BufReadPre Makefile noremap <buffer> <leader>B :w<CR>:!make <CR>
    " autocmd BufReadPre .vim,.vimrc,vimrc* noremap <buffer> <leader>B :w<CR>:source ~/.vim/init.vim <CR>
    " autocmd BufReadPre .zshrc,zshrc* noremap <buffer> <leader>B :w<CR>:!source % <CR>
    let s:ft = &filetype
endfunction


function! SearchInFile(pattern)
    " Good for searching text with special characters
    let oldpat=@/
    let @/=a:pattern
    let old_a=@a
    normal! gg"aygn
    let result=@a
    let @a=old_a
    let @/=oldpat
    return result
endfunction
