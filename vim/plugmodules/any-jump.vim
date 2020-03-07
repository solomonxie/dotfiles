""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Any Jump - Reference/Usage search                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/pechorin/any-jump.vim
"
"IDE madness without overhead for 40+ languages
"Vim plugin for jumping to defitinitions and references/usages through nice ui.
"nvim 0.4+ or vim 8.2+ required
"Based on syntax rules for 40 languages and fast regexp engines like ripgrep and ag.
"Required rg or ag to be installed.

Plug 'pechorin/any-jump.vim'


"Disable preset key mappings
let g:any_jump_disable_default_keybindings = 1

let g:any_jump_list_numbers = 1
let g:any_jump_references_enabled = 1
let g:any_jump_grouping_enabled = 1  "Press T to toggle
let g:any_jump_preview_lines_count = 5
let g:any_jump_max_search_results = 7
let g:any_jump_search_prefered_engine = 'rg'  "rg|ag
let g:any_jump_results_ui_style = 'filename_last'  "filename_fist|filename_last
let g:any_jump_remove_comments_from_results = 1


" Any-jump window size & position options
let g:any_jump_window_width_ratio  = 0.7
let g:any_jump_window_height_ratio = 0.6
let g:any_jump_window_top_offset   = 4

" let g:any_jump_keyword_match_cursor_mode', 'word'
