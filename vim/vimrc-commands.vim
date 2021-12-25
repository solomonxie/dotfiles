"----------------------------------------------------------------------------------------"
"|       __     ___              ____                                          _        |"
"|       \ \   / (_)_ __ ___    / ___|___  _ __ ___  _ __ ___   __ _ _ __   __| |___    |"
"|        \ \ / /| | '_ ` _ \  | |   / _ \| '_ ` _ \| '_ ` _ \ / _` | '_ \ / _` / __|   |"
"|         \ V / | | | | | | | | |__| (_) | | | | | | | | | | | (_| | | | | (_| \__ \   |"
"|          \_/  |_|_| |_| |_|  \____\___/|_| |_| |_|_| |_| |_|\__,_|_| |_|\__,_|___/   |"
"|                                                                                      |"
"----------------------------------------------------------------------------------------"


"<Files>----------------------------------------------------{
    noremap <Leader>o :browse oldfiles<CR>
    command! OpenThisOnMac :silent exec "!open %"<CR>
    command! OpenAllInThisDir :next *
    "{Change pwd/Current Directory to be same with buffer}
    command! CDToCurrentDir :cd %:p:h
    command! R :source ~/.vimrc
    command! BufferCount :call HowManyBuffers()
"}


"<Grep & Open files>-----------------------------------------{
    " command! GrepO :normal :call GrepOpen('haha')
    command! Vimrc :call LoadVimrc()
    command! CloseAllBuffers :normal :bufdo bd<CR>
    "command! CloseAllBuffers :% bd|e#
    command! TerminalOpenAtBottom :bot split \| resize 10 \| terminal<CR>i
"}

"<Path>-------------------------------------------{
    command! Cwd echo expand('%')
    command! CwdCopy let @+ = expand('%') | echo 'Copied: ' @+
    command! C let @+ = expand('%') | echo 'Copied: ' @+
    command! Pwd echo expand('%:p')
    command! PwdCopy let @+ = expand('%:p') | echo 'Copied: ' @+
    command! P let @+ = expand('%:p') | echo 'Copied: ' @+
    command! FilenameCopy let @+ = expand('%:t') | echo 'Copied: ' @+
    command! F let @+ = expand('%:t') | echo 'Copied: ' @+
    "command! CopyFolderRelativePath let @+ = expand('%:h') | echo 'Copied: ' @+
    "command! CopyFolderAbsolutePath let @+ = expand('%:p:h') | echo 'Copied: ' @+
"}


"<Git>------------------------------------------------------------------{
    command! RemoteGitFileReference call GetGitRemoteCodeReferenceLink()
    command! OpenChangedFiles :call EditChangedFiles()<CR>
"}


"<Spelling>---------------------------------------------------------{
    command! SpellCheck01On  setlocal spell spelllang=en,en_us,cjk
    command! SpellCheck02Off setlocal nospell
"}


"[Session]----------------------------------{
    "{Save session}
    nnoremap <leader>S :call SaveSession()<CR><ESC>
    command! SaveSessionCmd :call SaveSession()
    "{Load session}
    " noremap <Leader>R :source ~/vim-session.vim<CR><ESC>
    nnoremap <leader>R :call LoadSession()<CR><ESC>
    command! LoadSessionCmd :call LoadSession()
    "autocmd VimEnter * call LoadSession()
    autocmd VimLeave,QuitPre,FocusLost * if len(getbufinfo({'buflisted':1}))>=2 | call SaveSession() | endif

    nnoremap <Leader>S :call SaveSession()<CR><ESC>
    nnoremap <Leader>R :call LoadSession()<CR><ESC>

    augroup AutoSaveSession
        autocmd!
        autocmd VimLeave,QuitPre * if len(getbufinfo({'buflisted':1}))>=2 | call SaveSession() | endif
    augroup end
"}


"[Prettify/Formatting]--------------------------{
    command! PrettifyJson :% !python -m json.tool
"}


"[Reload Vimrc]--------------------------{
    command! SO :source ~/myconf/dotfiles/vim/nvimrc.vim
"}
