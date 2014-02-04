latex-centric-vim
=================

dot files for vim with just a few plugins to aid in Latex editing

I wanted a minimal, non intrusive setup for Latex editing. See for instance the
modified, hyper minimal, almost monochrome grey theme. No actual Latex plugins
are used, as I find them all to be somewhat outdated slow and buggy. Instead
fall back on latexmk, ultisnips, and ctags for cite/ref completion. 

More specifically running latexmk with -pvc option frees one to run it once in
terminal and forget.
 
On OSX forward and inverse search with pdf, is easily accomodated by adding a
few lines to .vimrc. 
 
While not everyone uses pdf synchronization, \ref, \cite completion is hard to
manage without. Thankfully this is easily accomplished with vim ctags completion
function. It might help to first reformat labels in your bib files using Jabref.
Note vim ctags completion is lightning fast, but a little inflexible as it does
not fuzzy search. YouCompleteMe should enable fuzzy search to the equation, but I
couldn't get it to work. But I don't think it is very necessary. 


If you want to mirror this I would suggest deleting the undo, and view folders.
