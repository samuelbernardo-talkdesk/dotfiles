"
" dotvim : https://github.com/dotphiles/dotvim
" dotvim (fork): git@github.com:samuelbernardo-talkdesk/dotvim.git
" dotfiles: git@github.com:samuelbernardo-talkdesk/dotfiles.git
" ensime: http://ensime.org/editors/vim/install/
"
" Setup vim and load required plugins before dotvim
" and integrate with ensime engine
"
" Authors:
"   Samuel Bernardo <samuelbernardo@tecnico.ulisboa.pt>
"   Ben O'Hara <bohara@gmail.com>
"

" vim-latex plugin
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Call dotvim
source ~/.vim/dotvim.vim

if has("user_commands")
  set nocompatible
  filetype off
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  "let g:vundles=['general', 'git', 'hg', 'programming', 'completion', 'ruby', 'python', 'misc']
  let g:vundles=['general', 'python', 'programming', 'git', 'php', 'ruby', 'javascript', 'html', 'misc', 'java', 'perl']
  "let g:neocomplcache_enable_at_startup = 1
  " Load 'vundles'
  source ~/.vim/vundles.vim
  " Add extra bundles here...
  " Bundle 'reponame'
  Bundle 'ensime/ensime-vim'
  Bundle 'derekwyatt/vim-scala'
  Bundle 'dodie/vim-monokai-refined'
  Bundle 'luochen1990/rainbow'
  Bundle 'xuyuanp/nerdtree-git-plugin'
  Bundle 'airblade/vim-gitgutter'
  Bundle 'vim-airline/vim-airline-themes'
endif

" Override colorscheme from base16
" let g:dotvim_colorscheme = 'scheme'
let g:dotvim_colorscheme = 'jellybeans'
let g:rainbow_active = 1

" ensime-server socket error
"let ensime_server_v2=1

" Customize to your needs...

" ==========================================================================================================================
" ====== KEYBINDINGS =======================================================================================================
" ==========================================================================================================================

" Toggles line numbers and list characters (see set listchars)
map <F6> :set number! list! <bar> :NERDTreeToggle <bar> :GitGutterToggle <CR>

" ==========================================================================================================================
" ====== FUNCTIONALITY =====================================================================================================
" ==========================================================================================================================
" Froups of lines with the same indent form a fold
set foldmethod=indent

" Starts editing with all folds closed
set foldlevelstart=0

" A tab will ocupy the size of 2 spaces
set tabstop=2
" Number of spaces to use for each step of (auto)indent.  Used for |'cindent'|, |>>|, |<<|, etc.
set shiftwidth=2
" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <Backspace>.
set softtabstop=2
" Round indent to multiple of 'shiftwidth'.  Applies to > and < commands.
set shiftround
" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" 'tabstop' or 'softtabstop' is used in other places.  A <BS> will delete
" a 'shiftwidth' worth of space at the start of the line.
set smarttab

" Substitutes tabs for spaces, but handles shiftwidth worth of spaces as a tab
" autocmd FileType ruby,scala set expandtab
set expandtab

" Do smart autoindenting when starting a new line.
set smartindent

" Copy indent from current line when starting a new line
set autoindent

" List tab (with >-) and end of line (with $) characthers
"set list
"set listchars=tab:>-,eol:$

set nowrap

" Automatic indentation based on file type
filetype indent on
filetype plugin on

" Allows backspacing over autoident, over line breaks (join lines)
" and over the start of the line
set backspace=indent,eol,start

" Remembers the last 1000 search patterns
set history=1000

" First tab completes as much as possible and shows the list if there is
" more than one matching item. Next tabs iterate through the list.
set wildmenu
set wildmode=list:longest,full

" While typing a search command, show where the pattern, as it was typed
" so far, matches. The matched string is highlighted.
set incsearch

" A new vsplited window will appear to the right of the current one
set splitright
" A new splited window will apperar bellow the current one.
set splitbelow

" When "on" the commands listed below move the cursor to the first non-blank of the line.
set startofline

" More intuitive selecting in visual mode
set selection=exclusive

"NERDTree configuration
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeTabsToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeToggle="<F2>"
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = 'RO'

let g:nerdtree_tabs_open_on_console_startup=1

" Fix annoying surround.vim message
vmap s S

" Use unix line endings (LF) unless the file already has DOS line endings
set fileformats=unix,dos
" Set the initial buffer to unix line endings
set fileformat=unix

"Indicates a fast terminal connection.  More characters will be sent to
"the screen for redrawing, instead of using insert/delete line commands.
set ttyfast

" Quickly jump to opening brace and back to avoid mistakes
set showmatch
set matchtime=1

"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Typechecking after writing
autocmd BufWritePost *.scala silent :EnTypeCheck

" Easy Type Inspection
nnoremap <localleader>t :EnTypeCheck<CR>

" Customize the browser used for :EnDocBrowse by setting an environment variable, in your shell initialization
" defining the following variable
" $ export BROWSER="firefox %s"


" ==========================================================================================================================
" ====== VISUAL ============================================================================================================
" ==========================================================================================================================
"set background=dark
"syntax on
"colorscheme jellybeans

" Spell checking
" setglobal spell spelllang=en_gb

" Highlight search terms
set hlsearch

" Make spelling mistake highlighting easier on the eyes.
" SpellBad = words that are not recognized by the spellchecker
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=red
" SpellCap = words that should start with a capital
highlight clear SpellCap
highlight SpellCap cterm=underline ctermfg=blue
" SpellLocal = words that are recognized by the spellchecker as words that are used in another region
highlight clear SpellLocal
highlight SpellLocal cterm=underline ctermfg=blue
" SpellRare = words that are recognized by the spellchecker as words that are hardly ever used
highlight clear SpellRare
highlight SpellRare cterm=underline ctermfg=blue

" Always show the status line
set laststatus=2
" Status line content
set statusline=%F\ [%{strlen(&fenc)?&fenc:'none'}][%{&ff}]%y%m%h%w%r%=[column:\ %v][line:\ %l\ of\ %L\ (%p%%)]"
highlight StatusLine cterm=NONE ctermbg=NONE ctermfg=gray guibg=#202020 guifg=white

" Highlight the line the cursor is on
set cursorline

" Always show the last line on the screen, even when it's too long (gets
" rid of the annoying @@@@@ crap)
set display+=lastline

" No annoying flashes
set novb

" Fix GNOME disappearing mouse bug
set nomousehide

" The mouse is enabled for normal, insert and command-line modes.
set mouse=a

" Hides all scroll bars
set guioptions-=r,l,L

" Show line numbers
set nu
nnoremap <F7> :set relativenumber!<cr>

" Don't show the intro message when starting Vim
set shortmess+=I

" Ensure the display is updated while executing macros
set nolazyredraw

" When the page starts to scroll, keep the cursor 4 lines from the top and 8
" lines from the bottom
set scrolloff=4

" Show the command as it's being typed in the lower right
set showcmd

" Line wrap
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
set formatoptions-=t
set formatoptions+=l

