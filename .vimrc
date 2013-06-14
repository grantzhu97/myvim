"  A vimrc file for.
"
" Maintainer:	Grant zhu <grantzhu97@gmail.com>
" Last change:	2018 Apr 16
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

set nobackup

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  "set mouse=a
  set mouse=v
endif

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
  filetype plugin indent on

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
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Customer define 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Version:
" 	0.1
"
" REFERENCE:
"	http://amix.dk/vim/vimrc.html
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" set to auto read when a file is change from the outside
set autoread
set autowrite
set modified

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"set auto read when a file is changed frome outside
set t_Co=256
set hid           " switch buffer even no save
set nu            " show line number
"set nonumber
set incsearch
set hlsearch
set ignorecase
set cindent
"set nofen
set fdl=10
set ts=4
set bg=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set 8 lines to the cursor - when moving vertically using j/k
set so=8

" Turn on the wild menu
set wildmenu

" ignore compiled files
set wildignore=*.o,*~,*.pyc

" Height of the command bar
set cmdheight=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" When searching try to be smart about case
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" set color scheme
" colorscheme vc
"colorscheme default
colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
"
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
":set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P
set statusline=\ %n 
set statusline+=\ %{HasPaste()}
set statusline+=\%F%m%r%h\ %w%y
set statusline+=\ CWD:\ %r%{getcwd()}%h 
set statusline+=\ %=%{v:register}
set statusline+=\ %-18.(%L\/%l,%c%V%)\ %P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
"map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"highlight WhitespaceEOL ctermbg=red guibg=red
"match WhitespaceEOL /\s\+$/

"For a list of all current settings, at the  :  prompt, enter:
"set all
"For a list of everything that you have set, at the  :  prompt, enter:
"set

" Search highlighting define
" terminals
hi Search cterm=NONE ctermfg=white ctermbg=blue
" gui
hi Search guibg=peru guifg=wheat

" OS detect
if (has("win32") || has("win64") || has("win32unix"))
        let g:isWin = 1
    else
	let g:isWin = 0
endif

" set to utf8
if (g:isWin)
	let &termencoding=&encoding
	set fileencodings=utf8,cp936,ucs-bom,latin1
else
	set encoding=utf8
	set fileencodings=utf8,gb2312,gb18030,ucs-bom,latin1
endif

"Fast reloading of the .vimrc
"map <silent> <leader>ss :source ~/.vimrc<cr>

"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>

"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" set current file path to vim current path
map <leader>cd :cd %:p:h<cr>

" Fast saving
map <leader>w :w!<cr>
map <leader>q :q!<cr>
map <leader>qa :qa!<cr>

" auto complete
inoremap <leader>1 ()<esc>:let leavechar=")"<cr>i
inoremap <leader>2 []<esc>:let leavechar="]"<cr>i
inoremap <leader>3 {}<esc>:let leavechar="}"<cr>i
inoremap <leader>4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap <leader>q ''<esc>:let leavechar="'"<cr>i
inoremap <leader>w ""<esc>:let leavechar='"'<cr>i

iab idate <c-r>=strftime("%Y-%m-%d")<CR>
iab itime <c-r>=strftime("%H:%M")<CR>
iab imail Grantzhu <grantzhu97@gmail.com>
iab iname Grant zhu

" file explorer
"""""""""""""""""""""""""""""
"netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 45
nmap <silent> <leader>fe :Sexplore!<cr>

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 45  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = "FileExplorer,BufExplorer|TagList"
let g:winManagerWindowLayout = "FileExplorer,BufExplorer,TagList"
let g:winManagerWidth = 45
let g:defaultExplorer = 0
" ctrl + wf
nmap <C-W><C-F> :FirstExplorerWindow<cr>
" ctrl + wb
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>
map <silent> <F9> :WMToggle<cr>

" high light current line
" before marks
set cursorline
:hi CursorLine   cterm=NONE ctermbg=darkgreen ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkgreen ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1

" For showmarks plugin
hi ShowMarksHLl ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
hi ShowMarksHLu ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black


" Open file in a new tab
"nmap gf :tabedit <cfile><cr>

""""""""""""""""""""""""""""""
" mark setting
"""""""""""""""""""""""""""""
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hr <Plug>MarkRegex

"execute project related configuration in current directory
if filereadable("workspace.vim")
	source workspace.vim
endif

""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable("./filenametags")
	let g:LookupFile_TagExpr = '"./filenametags"'
endif
"map LookupFile to,lk
nmap <silent> <leader>lk :LUTags<cr>
"map LUBufs to,ll
nmap <silent> <leader>ll :LUBufs<cr>
"map LUWalk to,lw
nmap <silent> <leader>lw :LUWalk<cr>


" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
	let _tags = &tags
	try
		let &tags = eval(g:LookupFile_TagExpr)
                let newpattern = '\c' . a:pattern
                let tags = taglist(newpattern)
	catch
		echohl ErrorMsg | echo "Exception: " . v:exception |echohl NONE
		return ""
	 finally
	        let &tags = _tags
	 endtry

	" Show the matches for what is typed so far.
	let files = map(tags, 'v:val["filename"]')
	return files
endfunction

let g:LookupFile_LookupFunc ='LookupFile_IgnoreCaseFunc'


" Quickfix
autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make -j8<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw<cr>
map <F3> :cp<cr>
map <F4> :cn<cr>
set switchbuf = "newtab"

"os detect
let s:uname = system("echo -n \"$(uname)\"")

"cscope setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    if s:uname == "Darwin"
        set csprg=/opt/local/bin/cscope
    else
        set csprg=/usr/bin/cscope
    endif
    set csto=1
    set cst
    set nocsverb
     " add any database in current directory
    if filereadable("cscope.out")
		cs add cscope.out
	endif
     " add addtional database
    "if filereadable("~/src/winddk_src/cscope.out")
		"cs add ~/src/winddk_src/cscope.out
	"endif
	set csverb
endif

nmap <C-]>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-]>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-]>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-]>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-]>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-]>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-]>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-]>d :cs find d <C-R>=expand("<cword>")<CR><CR>


" VimEnter                   After doing all the startup stuff, including
"                            loading .vimrc files, executing the "-c cmd"
"                            arguments, creating all windows and loading
"                            the buffers in them.
" CCTree auto load cscope.out 
" ctrl + | + </>
"autocmd Vimenter * CCTreeLoadDB cscope.out
let g:CCTreeKeyTraceForwardTree = '<C-\>>' 
let g:CCTreeKeyTraceReverseTree = '<C-\><' 
let g:CCTreeKeyHilightTree = '<C-l>'        " Static highlighting
let g:CCTreeKeySaveWindow = '<C-\>y' 
let g:CCTreeKeyToggleWindow = '<C-\>w' 
let g:CCTreeKeyCompressTree = 'zs'     " Compress call-tree 
let g:CCTreeKeyDepthPlus = '<C-\>=' 
let g:CCTreeKeyDepthMinus = '<C-\>-'


fun! SPLITAG() range
	let oldfile=expand("%:p")
	if &modified
		split
	endif

	exe "tag ". expand("<cword>")
	let curfile=expand("%:p")
	if curfile == oldfile
		let pos=getpos(".")
		if &modified
			" if we have split before:
			quit
		endif
		call setpos('.', pos)
	endif
endfun
nmap <C-]> :call SPLITAG()<CR>z.


" config taglist
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window =1
"map <silent> <F9> :TlistToggle<cr>
nmap <silent> <leader>l :TlistToggle<cr>

" Tagbar
map <silent> <F8> :TagbarToggle<cr>

" settings for compile
map <F7> :w!<cr>:make -j8<cr>
"map <F7> :w<cr>:make -j8 TARGET_PRODUCT=iMX53 TARGET_TOOLS_PREFIX=tools/android-toolchain-eabi/bin/arm-linux-androideabi- boottarball systemtarball userdatatarball > /dev/null <CR>
"map <F7> :w<cr>:make -j8 TARGET_PRODUCT=iMX53 TARGET_TOOLS_PREFIX=tools/android-toolchain-eabi/bin/arm-linux-androideabi- <CR>
map <F7><F7> :make clean<CR>
"map <F7> :w<cr>:!python %<cr>

" F10 add comments at the end; Shift+F10 comment this line; double Shift+F10
" uncomment this line.
map  <S-F10> <ESC>I//<ESC><CR>
map  !<S-F10> <ESC>I//<ESC><CR>
map  <S-F10><S-F10> 02x<ESC><CR>
map  !<S-F10><S-F10> <ESC>02x<ESC><CR>
map  <F10> <ESC>$a//
map  !<F10> <ESC>$a/

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

"
nnoremap <silent> <F6> :Rgrep<CR>
" android
":let Grep_Default_Filelist = '*.c *.cpp *.asm Makefile *.mk .config *.h *.java *.sh *.rc'
":let Grep_Default_Filelist = '*.c *.cpp *.java'
":let Grep_Default_Filelist = '*.mk Makefile'
" C&C++
:let Grep_Default_Filelist = '*.c *.cpp *.asm Makefile *.mk .config *.h *.inc *.py'
" python
":let Grep_Default_Filelist = '*.py'
:let Grep_Skip_Dirs = '.git .svn'
:let Grep_Skip_Files = '*.bak *~ *.swp'

:au QuickFixCmdPre * write

" system tags
"set tags = tags
"set tags+=~/.ctags/systags
set tags+=~/.ctags/winddk.tags

" You can visually select text then press ~ to convert the text to UPPER CASE, then to lower case, then to Title Case. Keep pressing ~ until you get the case you want.
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" extern here:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" octave
autocmd FileType octave setlocal keywordprg=info\ octave\ --vi-keys\ --index-search

" Jumping between control statements
let s:conditionalEnd = '\(([^()]*\)\@!\<end\>\([^()]*)\)\@!'
autocmd FileType octave let b:match_words = '\<if\>\|\<while\>\|\<for\>\|\<switch\>:' .
       \ s:conditionalEnd . ',\<if\>:\<elseif\>:\<else\>:' . s:conditionalEnd

"
let g:pydiction_menu_height = 20
let g:pydiction_location = '~/.vim/after/ftplugin/complete-dict'


"
"set fdm=manual
set fdm=indent
"set fdm=expr
"set fdm=syntax
"set fdm=diff
"set fdm=marker
"
" taghighlight settings
" UpdateTypesFile     -- create the syntax highlighting file used to show the extra colouring, if you have tag file, don`t use it.
" UpdateTypesFileOnly -- use the current tags file rather than genrating a new one
"if has("cscope")
    "if ! exists('g:TagHighlightSettings')
        "let g:TagHighlightSettings = {}
    "endif

    "let g:TagHighlightSettings['IgnoreFileScope']='True'
    "let g:TagHighlightSettings['TagFileName']='~/.vim/winddk.tags'
    "let g:TagHighlightSettings['EnableCscope'] = 1
    "if s:uname == "Darwin"
        "let g:TagHighlightSettings['CscopeExecutable'] = '/opt/local/bin/cscope'
    "else
        "let g:TagHighlightSettings['CscopeExecutable'] = '/usr/bin/cscope'
    "endif
"endif

" rainbow colors copied from and best suited for dark gruvbox colorscheme (https://github.com/morhetz/gruvbox):
let g:rainbow_guifgs = [
    \ '#458588',
    \ '#b16286',
    \ '#cc241d',
    \ '#d65d0e',
    \ '#458588',
    \ '#b16286',
    \ '#cc241d',
    \ '#d65d0e',
    \ '#458588',
    \ '#b16286',
    \ '#cc241d',
    \ '#d65d0e',
    \ '#458588',
    \ '#b16286',
    \ '#cc241d',
    \ '#d65d0e',
    \ ]
au FileType c,cpp,objc,objcpp,inc call rainbow#load()

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
	syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
	"hi def link cppFuncDef Special
	hi cppFuncDef  guifg=#3EFFE2
endfunction
autocmd Syntax cpp call EnhanceCppSyntax()
