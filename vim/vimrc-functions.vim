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
    let repo = trim(system("git remote get-url origin | sed "s/^git@//; s/\.git$//""))
    let branch = trim(system("git rev-parse --abbrev-ref HEAD"))
    let cwd = expand("%")
    let lineno = line(".")
    let url = "https://".repo."/blob/".branch."/".cwd."#L".lineno
    let @+ = url
    echo "Copied: " url
endfunction


function! GetSessionPath()
    let gitroot = trim(system("git rev-parse --show-toplevel"))
    if isdirectory(gitroot)
        let session_path = gitroot . "/.git/workspace.vim"
    else
        let session_path = "~/.non-repo-session.vim"
    endif
    return session_path
endfunction


function! SaveSession()
    let session_path = GetSessionPath()
    execute "mksession! " . session_path
    echo "Saved session to: " . session_path
endfunction


function! LoadSession()
    let session_path = GetSessionPath()
    execute "source " . session_path
    ":echo "Load session from workspace.vim"
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
    " REQUIRES:
    " 1. MACOS
    " 2. VSCODE + DEBUG LAUNCHER (EXTENSION)
    let file_path = expand('%:p')
    let cmd = "open 'vscode://fabiospampinato.vscode-debug-launcher/file?args=". file_path ."'"
    echo system(cmd)
endfunction
