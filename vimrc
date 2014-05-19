
call pathogen#infect()
syntax on
filetype plugin indent on

"  General Settings
if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
   set foldcolumn=12
  set formatoptions=ant
  set textwidth=80
  set wrapmargin=0
  set nohlsearch
  highlight SignColumn guibg=bg
      endif    
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
autocmd Colorscheme * highlight FoldColumn guifg=black guibg=bg
  "augroup PROSE|
   "autocmd InsertEnter <buffer> set fo+=a
   "autocmd InsertLeave <buffer> set fo-=a
 "augroup END"augroup END
"Latex related
   let g:tex_flavor = "latex"
   let g:tex_isk = '@,48-57,58,_,192-255'
set guioptions-=r 
set guioptions-=l
set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set undofile                " Save undo's after file closes
set undodir=/users/yashasavelyev/.vim/undo " where to save undo histories
set undolevels=100000         " How many undos
set undoreload=10000		
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set nohlsearch
" set macmeta
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
  nmap <leader>P <Plug>yankstack_substitute_newer_paste
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc


syntax on		" syntax highlight
" set hlsearch		" search highlighting

if has("gui_running")	" GUI color and font settings
  set guifont=Source\ Code\ Pro:h18
  set background=light 
  "set vimroom_background=dark
"  set cursorline        " highlight current line
 colorscheme grey 
  highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none
else
" terminal color settings
  set t_Co=256          " 256 color mode
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
set ignorecase		" ignore case when searching
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
" map <leader>t :tabnew<CR>
" close tab
" map <leader>c :tabclose<CR> 

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
" I find the default register behavior uncomfortable 
" au VIMENTER unmap p nnoremap p "0p
" nnoremap p "0p
nnoremap d "dd
vnoremap d "dd
nnoremap D "dD
vnoremap D "dD
nnoremap c "dc
vnoremap c "dc
nnoremap C "dC
vnoremap C "dC

" noremap w W
" noremap W w
" noremap b B
" noremap B b
 map f /
 map F ?
 map t <leader><leader>t
 map T <leader><leader>T
  " map F  <leader><leader>F
"  map f <leader><leader>f
"  vmap <leader><leader>F
 
 "nmap F ?  nnoremap v/ ?
 map 9 $
 nmap j gj
 nmap k gk
 noremap <Space> .
 noremap <S-Space> ?<Space><enter>
 "vnoremap <Space> /<Space><enter>
 "vnoremap <S-Space> <CR> <Space><CR>

 nmap <S-h> v<Left>T<Space>ad
 nmap <S-l> vt<Space>ad
 "imap <D-Space> <C-X><C-o>
"  imap <C-s> <Esc>:w<CR>
 "nunmap w
 "map ' "
 "map " '
 "map
"  nmap w <leader><leader>w
"  vmap w <leader><leader>w
"  nmap b <Leader><Leader>b
"  vmap b <Leader><Leader>b
"  nmap e <Leader><Leader>e
"  vmap e <Leader><Leader>e
"  nmap ge <Leader><Leader>ge
"  vmap ge <Leader><Leader>ge 
"  nmap ] ]S
"  nmap [ [S 


  

 "nnoremap g zg
 "nnoremap z= =  
 "nnoremap A A<Space>
 nnoremap <Backspace> i<Backspace><Esc> 
 ""map <D-/> <Leader>c<Space>
"  nnoremap / /\$<CR>
"  nnoremap ? ?\$<CR>
 map <D-/> <Leader>__
 nmap ` ~
 nmap 1 <C-o>
 nmap 2 <C-i>
 nmap <S-CR> k$
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
" map <D-s> <Esc>:w<CR> :silent ! /usr/local/bin/ctags -R<CR>
" map <C-s> <Esc>:w<CR> :silent ! /usr/local/bin/ctags -R<CR>
" Auto updating Ctags
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = '/usr/local/bin/ctags -a -f ' . tagfilename . ' --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost * call UpdateTags()
" autocmd VimLeave * exe ":silent ! /usr/local/bin/ctags -R"
map :tags  exe ":silent ! /usr/local/bin/ctags -R"

"Nerd Tree
 map <leader>e :NERDTreeFind<CR>
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

let g:auto_save = 1

"Highlight
hi MatchParen cterm=underline ctermbg=none ctermfg=none
hi MatchParen guibg=NONE guifg=green gui=NONE

    " UndoTree {
        noremap <Leader>u :UndotreeToggle<CR>
        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle=1
        noremap <D-z> u
    " }

nnoremap <D-e> :let g:ctrlp_match_window =
         \ 'bottom,order:btt,min:1,max:1000,results:1000'<CR>:CtrlPTag<CR>
map <D-t> :cd /users/yashasavelyev/GoogleDrive/workspace<CR>:CommandT<CR>
imap <D-t> <Esc>:cd /users/yashasavelyev/GoogleDrive/workspace<CR>:CommandT<CR>
" YouCompleteMe not using this plugin at the moment
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
   " let g:ycm_collect_identifiers_from_tags_files = 1
   " let g:ycm_auto_trigger = 0 
   " set tags=~/GoogleDrive/workspace/tags 
   " set tags=~/GoogleDrive/workspace/tagstest 
   " set tags+=/usr/local/texlive/texmf-local/bibtex/bib/local/tags
   "let g:ycm_key_invoke_completion = ''
   "let g:ycm_key_invoke_completion = '<D-5>'
   " Latex shortcuts

    
   "Latex compile. For various reasons I prefer to echo these so that i can
   "them to an external terminal and run there.
   
map <Leader>l :!echo latexmk -pvc -pdf -file-line-error -synctex=1  -interaction=nonstopmode -recorder<CR>
    \ :!echo %:p:h/document.tex<CR>
map <Leader>s :!echo  latexmk -pvc -pdf -file-line-error -synctex=1  -interaction=nonstopmode -recorder<CR>
"forward search on os X
map <silent> <Leader>v :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline
                \ <C-R>=line('.')<CR>  ~/GoogleDrive/workspace/%:h/document.pdf
                \ ~/GoogleDrive/workspace/%<CR>
"let g:LatexBox_latexmk_options="-pdflatex='pdflatex -interaction=nonstopmode -synctex=1 \%O \%S'"
" let g:LatexBox_latexmk_async=1
"let g:LatexBox_latexmk_preview_continuously=1
"let g:LatexBox_quickfix=2
"let g:LatexBox_show_warnings=0
"let g:LatexBox_ignore_warnings = ['Package pgfplots Warning']
" autocmd FileType tex call Tex_SetTeXCompilerTarget('View','pdf') 
"let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
"let tlist_make_settings  = 'make;m:makros;t:targets'
" let g:easytags_cmd = '/usr/local/bin/ctags'
"  let g:easytags_events = ['BufWritePost']
 
