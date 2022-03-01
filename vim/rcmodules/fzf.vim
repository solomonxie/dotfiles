"
" This is the default extra key bindings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' ,
    \ 'ctrl-e': 'edit' ,
\}

" let g:fzf_layout = { 'down': '~40%' }  " down | up | left | right
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

let g:fzf_preview_window = ['right:40%', 'ctrl-/']  " up|down|left|right


" let g:fzf_buffers_jump = 1  " [Buffers] Jump to the existing window if possible

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

"let g:fzf_history_dir = '~/.vim/fzf-history'  "[History] -> will block Ctrl-n & Ctrl-p keys

"- enew / -tabnew / 10split enew
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10split enew' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
  let height = float2nr(&lines * 0.7)
  let width = float2nr(&columns * 0.85)
  let horizontal = float2nr(&columns * 0.1)
  let vertical = &lines * 0.15
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  call nvim_open_win(buf, v:true, opts)
endfunction

"">> KEY MAPPINGS
nnoremap fd :Files<CR>
nnoremap fb :Buffers<CR>
nnoremap ft :FZFBTags<CR>
nnoremap fc :FZFHistory:<CR>
nnoremap fC :FZFCommands<CR>
nnoremap fh :FZFHistory<CR>
nnoremap fa :FZFRg<CR>
nnoremap fm :FZFMarks<CR>
nnoremap fs :FZFSnippets<CR>
nnoremap fl :FZFBLines<CR>

" nnoremap fg :GFiles<CR>
" nnoremap fb :call fzf#vim#buffers(fzf#vim#with_preview('right:0%'))<CR>
" nnoremap fa :call fzf#vim#ag('', fzf#vim#with_preview('right'))<CR>
""nnoremap <localleader>f :Files %:p:h<CR>
"" nnoremap <M-f> :Files<CR>
"" nnoremap <LocalLeader>f :Files<CR>
"" nnoremap <localleader>H :Helptags<CR>
"" nnoremap <localleader>h :History<CR>
"" nnoremap <localleader>c :History:<CR>
"" nnoremap <localleader>/ :History/<CR>
"" nnoremap <localleader>p :Snippets<CR>
"" nnoremap <localleader>C :BCommits<CR>
"" nnoremap <localleader>b :Buffers<CR>
"" nnoremap <localleader>t :Tags<CR>
"" nnoremap <LocalLeader>a :Ag<CR>
"" nnoremap <localleader>m :Marks<CR>
""nnoremap <localleader>p/ :Files ..
""nnoremap <localleader>color/ :Colors
""nnoremap <localleader>k/ :Maps<CR>
"nnoremap fd :Files<CR>
"" nnoremap fg :GFiles<CR>
"nnoremap fb :call fzf#vim#buffers(fzf#vim#with_preview('right:0%'))<CR>
"nnoremap ft :Tags<CR>
"nnoremap fc :History:<CR>
"nnoremap fC :Commands<CR>
"nnoremap fh :History<CR>
"nnoremap fa :Rg<CR>
"nnoremap fm :Marks<CR>
"" nnoremap fa :call fzf#vim#ag('', fzf#vim#with_preview('right'))<CR>
"nnoremap fs :Snippets<CR>
"" nnoremap fS :History/<CR>
"" nnoremap fm :Marks<CR>


" [Rg] Set preview window
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview(), <bang>0)

" " [Rg] disable matching file path
" command! -bang -nargs=* Rg
"     \ call fzf#vim#grep(
"     \   "rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
"     \   {'options': '--delimiter : --nth 4..'}, <bang>0)

" [Ag] disable matching file path
" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)


" MUST BE PLACED AFTER SETTINGS
"REF: https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'
