
Plug 'craigemery/vim-autotag'  "Navigate (manually gen tags)

let g:autotagTagsFile="~/.vim/tags"
if !isdirectory("~/.vim/tags")
   silent! call mkdir(s:vim_tags, 'p')
endif
