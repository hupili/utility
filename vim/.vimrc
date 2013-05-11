"HPL's vimrc file
"Edited for version 7.3.429

syntax on
set nu
set ai
set ci
set shiftwidth=4       " shift width
set tabstop=4       " tab stop
set softtabstop=4      " soft tab stop
set fdm=indent " vim will fold the codes according to indent
set mouse=   " avoid entering visual mode by mouse operation
set smarttab

" disable beepings
set vb t_vb=
set noerrorbells
" The above one works in my environment.
" The followings are suggestions from the Internet.
" Keep them here for future reference. 
" set t_vb=
" set visualbells 

" ============ File type managenment ======
filetype on 
filetype indent on
filetype plugin on
au BufNewFile,BufRead *.json set filetype=json
"au BufNewFile,BufRead *.tex set filetype=latex
"au BufNewFile,BufRead *.md set filetype=markdown

" === https://github.com/tpope/vim-pathogen
" for easier plugin installation
call pathogen#infect()

"Generally, I don't expand tab.
"Like 'Makefile' requires command to begin with a tab. 
"For situations where tab expansion is needed
"I put them into filetype plugins. 
"See '.vim/after/ftplugin'
set noet       " no expand tab

" colorscheme evening 
colorscheme default

" ==== Powerline customization
" The settings for new Powerline written in Python.
" I'm watching this project and will migrate to it once ready
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Recommended settings for (old) Powerline
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
" NOTE. Use ':PowerlineClearCache' to clear the chache after changing powerline statusline
"let g:Powerline_theme = 'solarized256'
"let g:Powerline_cache_enabled = 0
"call Pl#Hi#Segments(['fileformat'], {'n': ['gray8', 'gray2'],  'i': ['gray8', 'gray8']})
"call Pl#Theme#InsertSegment('watchout', 'after', 'fileformat')
"call Pl#Segment#Create('watchout', '%{&ff=="unix"?"":"Watch out!!"}', Pl#Segment#Modes('!N'))

" ==== NERDTree settings
let NERDTreeChDirMode=2 "CWD of vim is changed by NerdTree when the tree root is changed
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

" ==== Taglist settings
let Tlist_GainFocus_On_ToggleOpen=1 "auto locate cursor in Tlist window
let Tlist_File_Fold_Auto_Close = 1  "close tag tree for inactive files
let Tlist_Close_On_Select = 1       "close TL on select, use p if just view code but not exit
map <F4> :TlistToggle<CR>
"let g:tlist_markdown_settings = 'markdown;h:heading1;h:heading2;h:heading3'
let g:tlist_markdown_settings = 'markdown;h:Headlins'
let g:tlist_perl_settings = 'perl;s:Subroutines'
let g:tlist_tex_settings = 'latex;s:Sections;l:Labels;r:Refs;m:Marks;b:Bibs'
"let g:tlist_latex_settings = 'latex;s:Sections;l:Labels;r:Refs'

" ==== sub window moving shortcuts
map <silent>,h <C-w>h
map <silent>,j <C-w>j
map <silent>,k <C-w>k
map <silent>,l <C-w>l

" ==== Tab navigation shortcuts
map <F11> <ESC>gT<cr>
map <F12> <ESC>gt<cr>
map! <F11> <ESC>gT<cr>
map! <F12> <ESC>gt<cr>

" ==== make
map <F5> <ESC>:w<CR>:make<CR>
map! <F5> <ESC>:w<CR>:make<CR>
map <silent>,m <F5>

" * C-] uses ':tag' by default
" * g C-] uses ':tselect' by default 
"   and uses ':tag' if there's ambiguities
" * This makes C-] a better shortcut 
noremap <C-]> g<C-]>

" ==== about encoding
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf8,gbk,big5
" Touch a file called 'spell.enable' to enable spell checking.
" Rare word file is located in current directory to avoid 
" conflicts between multiple documents. 
" Remember to change the encodings accordingly
if (match(system("test -f spell.enable; echo $?"), "0") != -1)
	set spell
	set spf=spell.utf8.add
	map <F6> <ESC>[s
	map <F7> <ESC>]s
	map <F8> <ESC>zg
	map! <F6> <ESC>[s
	map! <F7> <ESC>]s
	map! <F8> <ESC>zg
endif


"================ defaults after installation ========

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set cindent

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"   set mouse=a
" endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.

  "filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  "autocmd BufReadPost *
  "  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  "  \   exe "normal! g`\"" |
  "  \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

