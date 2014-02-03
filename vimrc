
"set nocp
call pathogen#infect()
syntax on
filetype plugin indent on

" General Settings
if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
   set foldcolumn=12
  set formatoptions=ant
  set textwidth=80
  set wrapmargin=0
  highlight SignColumn guibg=bg
      endif    

      "Autocommands 
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
autocmd Colorscheme * highlight FoldColumn guifg=black guibg=bg
  "augroup PROSE|
   "autocmd InsertEnter <buffer> set fo+=a
   "autocmd InsertLeave <buffer> set fo-=a
 "augroup END"augroup END


set iskeyword=45,48-58,a-z,A-Z,192-255  "note these are not default so be careful with files other than .tex
set guioptions-=r 
set guioptions-=l
set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set undofile                " Save undo's after file closes
set undodir=/users/yashasavelyev/.vim/undo " where to save undo histories
set undolevels=100000         " How many undos
set undoreload=10000		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set nohlsearch

 




"filetype off          " necessary to make ftdetect work on Linux
syntax on
filetype on           " Enable filetype detection 
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc


syntax on		" syntax highlight
set hlsearch		" search highlighting

if has("gui_running")	" GUI color and font settings
  set guifont=Source\ Code\ Pro:h18
  set background=light 
  "set vimroom_background=dark
  set t_Co=256          " 256 color mode
"  set cursorline        " highlight current line
  "colorscheme ir_black  
  
"let moria_monochrome = 1  
 "colorscheme moria
 colorscheme grey 
  highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none
else
" terminal color settings
  colors monochrome 
endif

set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

"set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
"set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
"set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting{
   set expandtab        "replace <TAB> with spaces
   set softtabstop=3 
   set shiftwidth=3 

   au FileType Makefile set noexpandtab
"}      							

" status line {
set laststatus=1
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}




"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 
" set leader to ; 
let mapleader=';'
let g:mapleader=';'

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" open the error console
map <leader>cc :botright cope<CR> 
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split 
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split 
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split 
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split  
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others 
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab 
"map <S-H> gT
" go to next tab
"map <S-L> gt

" new tab
map <leader>t :tabnew<CR>
" close tab
map <leader>c :tabclose<CR> 

" ,/ turn off search highlighting
"nmap <leader>/ :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h




" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \	if &omnifunc == "" |
              \		setlocal omnifunc=syntaxcomplete#Complete |
              \	endif
endif

set cot-=preview "disable doc preview in omnicomplete

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css

"--------------------------------------------------------------------------- 
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
	set encoding=utf-8                                  
	set termencoding=big5
endfun

fun! UTF8()
	set encoding=utf-8                                  
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
	set encoding=big5
	set fileencoding=big5
endfun


"--------------------------------------------------------------------------- 
" PLUGIN SETTINGS
"--------------------------------------------------------------------------- 







" --- AutoClose - Inserts matching bracket, paren, brace or quote 
" fixed the arrow key problems caused by AutoClose
"if !has("gui_running")	
   "set term=linux
   "imap OA <ESC>ki
   "imap OB <ESC>ji
   "imap OC <ESC>li
   "imap OD <ESC>hi

   "nmap OA k
   "nmap OB j
   "nmap OC l
   "nmap OD 

" --- Command-T
let g:CommandTMaxHeight = 15

" --- SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
  



" --- TagBar
" toggle TagBar with F7
"nnoremap <silent> <F7> :TagbarToggle<CR> 
" set focus to TagBar when opening it
"let g:tagbar_autofocus = 1

" --- PowerLine
" let g:Powerline_symbols = 'fancy' " require fontpatcher
"


" --- vim-gitgutter
"let g:gitgutter_enabled = 1

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<D-j>"  
 

" KeyMaps for movement, other Remaps 
 

 map f <leader><leader>f
 map t <leader><leader>t
 map T <leader><leader>T
 noremap m /
 map F  <leader><leader>F
 "vmap f <leader><leader>f     
 "map M ?
 "vmap <leader><leader>F
 
 "nmap F ?  nnoremap v/ ?
 nmap j gj
 nmap k gk
 noremap <Space> /<Space><enter>
 noremap <S-Space> ?<Space><enter>
 "vnoremap <Space> /<Space><enter>
 "vnoremap <S-Space> ?<Space><enter>
 inoremap <CR> <Space><CR>

 nmap <S-h> v<Left>T<Space>ad
 nmap <S-l> vt<Space>ad
 "imap <D-Space> <C-X><C-o>
 imap <C-s> <Esc>:w<CR>
 "nunmap w
 "map ' "
 "map " '
 "map
 nmap w <leader><leader>w
 vmap w <leader><leader>w
 nmap b <Leader><Leader>b
 vmap b <Leader><Leader>b
 nmap e <Leader><Leader>e
 vmap e <Leader><Leader>e
 nmap ge <Leader><Leader>ge
 vmap ge <Leader><Leader>ge 
 nmap ] ]S
 nmap [ [S 
 "nnoremap g zg
 "nnoremap z= =  
 "nnoremap A A<Space>
 nnoremap <Backspace> i<Backspace><Esc> 
 map <D-/> <Leader>c<Space> 
 nmap ` ~
 nmap 1 <C-o>
 nmap 2 <C-i>
 noremap <Leader>1 :buffer 1<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
 noremap <Leader>2 :buffer 2<CR>
 noremap <Leader>3 :buffer 3<CR>
noremap <Leader>4 :buffer 4<CR>
noremap <Leader>5 :buffer 5<CR>
noremap <Leader>7 :buffer 7<CR>
noremap <Leader>6 :buffer 6<CR>
noremap <Leader>8 :buffer 8<CR>
noremap <Leader>9 :buffer 9<CR>
noremap <D-d> <C-d>
noremap <D-u> <C-u>
nnoremap <silent> <Leader>y :YRGetElem<CR>
map ' "
inoremap <D-]> <C-x><C-]>
inoremap <C-]> <C-x><C-]>




 

"Nerd Tree
 map <leader>e :NERDTreeFind<CR>
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
 

"Highlight
hi MatchParen cterm=underline ctermbg=none ctermfg=none
hi MatchParen guibg=NONE guifg=green gui=NONE

    " UndoTree {
        noremap <Leader>u :UndotreeToggle<CR>
        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle=1
        "noremap <D-z> :UndotreeToggle<CR> 
    " }

nnoremap <D-e> :let g:ctrlp_match_window =
         \ 'bottom,order:btt,min:1,max:1000,results:1000'<CR>:CtrlPTag<CR>
"autocmd VimEnter let g:ctrlp_match_window =
"'bottom,order:btt,min:1,max:10000,results:10000'
map <D-t> :cd /users/yashasavelyev/GoogleDrive/workspace<CR>:CommandT<CR>
"map <D-e> :cd /users/yashasavelyev/GoogleDrive/workspace<CR>:CommandT<CR>
imap <D-t> <Esc>:cd /users/yashasavelyev/GoogleDrive/workspace<CR>:CommandT<CR>
"CtrlP /users/yashasavelyev/GoogleDrive/workspace<cr>

" You complete me
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_auto_trigger = 0 
set tags=~/GoogleDrive/workspace/tags 
set tags=~/GoogleDrive/workspace/tagstest 
set tags+=/usr/local/texlive/texmf-local/bibtex/bib/local/tags

"let g:ycm_key_invoke_completion = ''
             
"let g:ycm_key_invoke_completion = '<D-5>'
" Latex shortcuts

map <silent> <Leader>l  :silent !latexmk -pdflatex='pdflatex -file-line-error -synctex=1'  
       \ -interaction=nonstopmode -pdf  
         \ % <CR>
map  <Leader>v  :!/Applications/Skim.app/Contents/SharedSupport/displayline
                \ <C-R>=line('.')<CR>  "%:p:h/document.pdf" 
                \ "%:p"<CR><CR>
"let g:LatexBox_latexmk_options="-pdflatex='pdflatex -interaction=nonstopmode -synctex=1 \%O \%S'"
"let g:LatexBox_latexmk_async=1
"let g:LatexBox_latexmk_preview_continuously=1
"let g:LatexBox_quickfix=2
"let g:LatexBox_show_warnings=0
"let g:LatexBox_ignore_warnings = ['Package pgfplots Warning']
" autocmd FileType tex call Tex_SetTeXCompilerTarget('View','pdf') 
"let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
"let tlist_make_settings  = 'make;m:makros;t:targets'

