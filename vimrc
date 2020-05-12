call plug#begin('~/.vim/plugged')

" essentials
Plug 'skywind3000/asyncrun.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': 'go'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ludovicchabant/vim-ctrlp-autoignore'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mileszs/ack.vim'
Plug 'ggreer/the_silver_searcher'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'wellle/targets.vim'

" status line
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/artify.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'maximbaz/lightline-ale'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'ryanoasis/vim-devicons'

" good to have
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-expand-region'
Plug 'anschnapp/move-less'
Plug 't9md/vim-choosewin'
Plug 'fcpg/vim-flattery'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'artnez/vim-wipeout'
Plug 'soywod/bufmark.vim'

" syntax, language specific highlighting, etc
Plug 'vim-syntastic/syntastic'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'for': 'go'}
Plug 'fatih/vim-nginx' , {'for' : 'nginx'}
Plug 'plasticboy/vim-markdown', {'for' : 'md'}
Plug 'hashivim/vim-hashicorp-tools'
Plug 'pearofducks/ansible-vim'
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'hashivim/vim-terraform', {'for': 'tf'}
Plug 'juliosueiras/vim-terraform-completion', {'for': 'tf'}
Plug 'ingydotnet/yaml-vim'


" color schemes
Plug 'morhetz/gruvbox'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" pythonic
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'nvie/vim-flake8', {'for': 'python'}

Plug 'vimwiki/vimwiki'

call plug#end()

let g:terraform_fmt_on_save=0

"=====================================================
"===================== SETTINGS ======================
set nocompatible
filetype off
filetype plugin indent on

set ttyfast
if !has('nvim')
    set ttymouse=xterm2
    set ttyscroll=3 "Maximum number of lines to scroll the screen. If there are more lines to scroll the window is redrawn. 
endif

set scrolloff=5          " Show 5 lines above the cursor while scrolling
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set backspace=indent,eol,start
set wildmenu
set ruler

set tabstop=4
set expandtab					" Insert space characters when tab is pressed
set shiftwidth=4
set laststatus=2
set encoding=utf8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set autowrite
set autoindent                  " Copy indent from current line when starting a new line 
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set mouse=a                     "Enable mouse mode

set noerrorbells             " No beeps
set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300

set pumheight=10             " Completion window max size

" For iTerm
if has('mouse_sgr')
    set ttymouse=sgr
endif

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" ~/.viminfo needs to be writable and readable
set viminfo='200

set lazyredraw          " Wait to redraw

" infinite undo
set undofile
set undodir=~/.cache/vim
let s:undos = split(globpath(&undodir, '*'), "\n")
call filter(s:undos, 'getftime(v:val) < localtime() - (60 * 60 * 24 * 90)')
call map(s:undos, 'delete(v:val)')

" color
syntax enable
set t_Co=256
set background=dark

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme gruvbox


" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" filetypes

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2

autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType json syntax match Comment +\/\/.\+$+

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.vue setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
autocmd BufNewFile,BufRead *.js setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab

augroup filetypedetect
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
augroup END


"=====================================================
"===================== STATUSLINE ====================

function! Devicons_Filetype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! Devicons_Fileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
function! Artify_active_tab_num(n) abort
  return Artify(a:n, 'bold')." \ue0bb"
endfunction
function! Tab_num(n) abort
  return a:n." \ue0bb"
endfunction
function! Artify_inactive_tab_num(n) abort
  return Artify(a:n, 'double_struck')." \ue0bb"
endfunction
function! Artify_lightline_tab_filename(s) abort
  return Artify(lightline#tab#filename(a:s), 'monospace')
endfunction
function! Artify_lightline_mode() abort
  return Artify(lightline#mode(), 'monospace')
endfunction
function! Artify_line_percent() abort
  return Artify(string((100*line('.'))/line('$')), 'bold')
endfunction
function! Artify_line_num() abort
  return Artify(string(line('.')), 'bold')
endfunction
function! Artify_col_num() abort
  return Artify(string(getcurpos()[2]), 'bold')
endfunction
function! Artify_gitbranch() abort
  if gitbranch#name() !=# ''
    return Artify(gitbranch#name(), 'monospace')." \ue725"
  else
    return "\ue61b"
  endif
endfunction
set laststatus=2  " Basic
" set noshowmode  " Disable show mode info
augroup lightlineCustom
  autocmd!
  autocmd BufWritePost * call lightline_gitdiff#query_git() | call lightline#update()
augroup END
let g:lightline = {}
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf529"
let g:lightline#ale#indicator_errors = "\uf00d"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline_gitdiff#indicator_added = '+'
let g:lightline_gitdiff#indicator_deleted = '-'
let g:lightline_gitdiff#indicator_modified = '*'
let g:lightline_gitdiff#min_winwidth = '70'
let g:lightline#asyncrun#indicator_none = ''
let g:lightline#asyncrun#indicator_run = 'Running...'

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],

let g:lightline.active = {
    \ 'left': [ [ 'artify_mode', 'paste' ],
    \           [ 'filename', 'fileformat', 'devicons_filetype', 'ctrlpmark' ] ],
    \ 'right': [ [ 'artify_lineinfo' ],
    \           [ 'syntastic' ],
    \           [ 'gitstatus' ] ]
    \ }
let g:lightline.inactive = {
    \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
    \ 'right': [ [ 'artify_lineinfo' ] ]
    \ }
let g:lightline.tabline = {
    \ 'left': [ [ 'vim_logo', 'tabs' ] ],
    \ 'right': []
    \ }
let g:lightline.tab = {
    \ 'active': [ 'artify_activetabnum', 'artify_filename', 'modified' ],
    \ 'inactive': [ 'artify_inactivetabnum', 'filename', 'modified' ] }

function! GitStatus()
    let changes = lightline_gitdiff#get_status()
    let branch = Artify_gitbranch()
    return branch . changes
endfunction

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:lightline.component_expand = {
      \ 'syntastic': 'SyntasticStatusLineFlag',
      \ }

let g:lightline.component_expand = {
      \ 'syntastic': 'error',
      \ }

let g:lightline.component = {
      \ 'artify_mode': '%{Artify_lightline_mode()}',
      \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 %3{Artify_line_num()}:%-2{Artify_col_num()}",
      \ 'gitstatus' : '%{GitStatus()}',
      \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
      \ 'vim_logo': "\ue7c5",
      \ 'mode': '%{lightline#mode()}',
      \ 'absolutepath': '%F',
      \ 'relativepath': '%f',
      \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
      \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
      \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
      \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
      \ 'modified': '%M',
      \ 'bufnum': '%n',
      \ 'paste': '%{&paste?"PASTE":""}',
      \ 'readonly': '%R',
      \ 'charvalue': '%b',
      \ 'charvaluehex': '%B',
      \ 'percent': '%2p%%',
      \ 'percentwin': '%P',
      \ 'spell': '%{&spell?&spelllang:""}',
      \ 'lineinfo': '%2p%% %3l:%-2v',
      \ 'line': '%l',
      \ 'column': '%c',
      \ 'close': '%999X X ',
      \ 'winnr': '%{winnr()}'
      \ }
let g:lightline.component_function = {
      \ 'devicons_filetype': 'Devicons_Filetype',
      \ 'devicons_fileformat': 'Devicons_Fileformat',
      \ 'filename': 'LightLineFilename',
      \  'ctrlpmark': 'CtrlPMark'
      \ }

let g:lightline = {'colorscheme' : 'gruvbox'}
"
"let s:modes = {
"      \ 'n': 'NORMAL', 
"      \ 'i': 'INSERT', 
"      \ 'R': 'REPLACE', 
"      \ 'v': 'VISUAL', 
"      \ 'V': 'V-LINE', 
"      \ "\<C-v>": 'V-BLOCK',
"      \ 'c': 'COMMAND',
"      \ 's': 'SELECT', 
"      \ 'S': 'S-LINE', 
"      \ "\<C-s>": 'S-BLOCK', 
"      \ 't': 'TERMINAL'
"      \}

"let s:prev_mode = ""
"function! StatusLineMode()
"  let cur_mode = get(s:modes, mode(), '')

"  " do not update higlight if the mode is the same
"  if cur_mode == s:prev_mode
"    return cur_mode
"  endif

"  if cur_mode == "NORMAL"
"    exe 'hi! StatusLine ctermfg=236'
"    exe 'hi! myModeColor cterm=bold ctermbg=148 ctermfg=22'
"  elseif cur_mode == "INSERT"
"    exe 'hi! myModeColor cterm=bold ctermbg=23 ctermfg=231'
"  elseif cur_mode == "VISUAL" || cur_mode == "V-LINE" || cur_mode == "V_BLOCK"
"    exe 'hi! StatusLine ctermfg=236'
"    exe 'hi! myModeColor cterm=bold ctermbg=208 ctermfg=88'
"  endif

"  let s:prev_mode = cur_mode
"  return cur_mode
"endfunction

"function! StatusLineFiletype()
"  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
"endfunction

"function! StatusLinePercent()
"  return (100 * line('.') / line('$')) . '%'
"endfunction

"function! StatusLineLeftInfo()
"  let branch = fugitive#head()
"  let filename = '' != expand('%:t') ? expand('%:t') : '[No Name]'
"  if branch !=# ''
"    return printf("%s | %s", branch, filename)
"  endif
"  return filename
"endfunction

"exe 'hi! myInfoColor ctermbg=240 ctermfg=252'

"" start building our statusline
"set statusline=

"" mode with custom colors
"set statusline+=%#myModeColor#
"set statusline+=%{StatusLineMode()}
"set statusline+=%*

"" left information bar (after mode)
"set statusline+=%#myInfoColor#
"set statusline+=\ %{StatusLineLeftInfo()}
"set statusline+=\ %*

"" go command status (requires vim-go)
"set statusline+=%#goStatuslineColor#
""set statusline+=%{go#statusline#Show()}
"set statusline+=%*

"" right section separator
"set statusline+=%=

"" filetype, percentage, line number and column number
"set statusline+=%#myInfoColor#
"set statusline+=\ %{StatusLineFiletype()}\ %{StatusLinePercent()}\ %l:%v
"set statusline+=\ %*

"=====================================================
"===================== MAPPINGS ======================

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","

" keep selected line selected while indenting
vnoremap < <gv
vnoremap > >gv

" Some useful quickfix shortcuts for quickfix
map <S-m> :cn<CR>
map <C-m> :cp<CR>

" put quickfix window always to the bottom
autocmd FileType qf wincmd J
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" Fast saving
nnoremap <leader>W :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" Center the screen
nnoremap <space> zz

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Source the current Vim file
nnoremap <leader>pr :Runtime<CR>

" Close all but the current one
nnoremap <leader>o :only<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Print full path
map <C-a> :echo expand("%:p")<cr>

" split resizing
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Exit on jk
imap jk <Esc>

" Map leader-z to fold toggling
nmap <leader>z za
"Re-open the current file
nmap <leader>R :edit!<CR>

" Source (reload configuration)
nnoremap <silent> <F5> :source $MYVIMRC && echo "Refreshed!"<CR>

nnoremap <F6> :setlocal spell! spell?<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Act like D and C
nnoremap Y y$

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" Do not show stupid q: window
map q: :q

" Toggle alternate buffer
nnoremap <leader><leader> <c-^>

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" tab navigation
nnoremap tm  :tabm<Space>
nnoremap tx  :tabclose<CR>
nnoremap th  :tabprev<CR>
nnoremap tl  :tabnext<CR>
nnoremap tH  :tabfirst<CR>
nnoremap tL  :tablast<CR>
nnoremap tn  :tabnew<CR>

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
if !has('gui_running')
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Visual Mode */# from Scrooloose {{{
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>


" create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>

"key to insert mode with paste using F2 key
map <F2> :set paste<CR>i
" Leave paste mode on exit
au InsertLeave * set nopaste

" ==================== PYTHON ==================== 
" leader-y to use yapf
autocmd FileType python nnoremap <leader>yf :0,$!yapf<Cr><C-o>

" Make buffer modifiable for yapf
au BufNewFile,BufRead *.py set modifiable
" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set foldlevel=99 |
    \ set foldmethod=indent

" Syntax highlighting
let python_highlight_all=1

highlight LineNr ctermfg=yellow
" jedi-vim
let g:jedi#goto_command = "<leader>yg"
let g:jedi#goto_assignments_command = "<leader>ya"
let g:jedi#goto_definitions_command = "<leader>yd"
let g:jedi#documentation_command = "<leader>yi"
let g:jedi#usages_command = "<leader>yn"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>yr"
"
"===================== PLUGINS ======================
"


" ==================== ansible-vim ====================

au BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible

let g:ansible_unindent_after_newline = 1
let g:ansible_name_highlight = 'b'
let g:ansible_yamlKeyName = 'yamlKey'
let g:ansible_attribute_highlight = 'ab'
let g:ansible_extra_keywords_highlight = 1

let g:ansible_goto_role_paths = './roles,../_common/roles'

function! FindAnsibleRoleUnderCursor()
  if exists("g:ansible_goto_role_paths")
    let l:role_paths = g:ansible_goto_role_paths
  else
    let l:role_paths = "./roles"
  endif
  let l:tasks_main = expand("<cfile>") . "/tasks/main.yml"
  let l:found_role_path = findfile(l:tasks_main, l:role_paths)
  if l:found_role_path == ""
    echo l:tasks_main . " not found"
  else
    execute "edit " . fnameescape(l:found_role_path)
  endif
endfunction

au BufRead,BufNewFile */ansible/*.yml nnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>
au BufRead,BufNewFile */ansible/*.yml vnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>

" ==================== Fonts ====================


" ==================== SimplyFold ====================
" Fold imports
let g:SimpylFold_fold_import = 1


" ==================== vim-flake8 ====================
autocmd FileType python map <buffer> <leader>l :call Flake8()<CR>
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_in_file=1  " show
" autocmd BufWritePost *.py call Flake8()

highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

" ==================== vim-syntastic ====================
let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['flake8']
" ==================== Fugitive ====================
vnoremap <leader>b :Gblame<CR>
nnoremap <leader>b :Gblame<CR>

" ==================== vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0
let g:go_echo_command_info = 1

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_autodetect_gopath = 1
" autocmd BufWritePre *.go :GoBuild

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 0

let g:go_modifytags_transform = 'camelcase'
let g:go_addtags_transform = "camelcase"

nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!

  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)

  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)

  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  " I like these more!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" ==================== CtrlP ====================
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'  " jump to a file if it's open already
let g:ctrlp_mruf_max=450    " number of recently opened files
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'top,order:btt,max:10,results:10'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}
let g:ctrlp_extensions = ['autoignore']
nnoremap <C-P> :CtrlP<cr>
inoremap <C-P> <esc>:CtrlP<cr>

" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1   
let g:delimitMate_expand_space = 1    
let g:delimitMate_smart_quotes = 1    
let g:delimitMate_expand_inside_quotes = 0    
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'   

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeTabsToggle<cr>
noremap <Leader>f :NERDTreeTabsFind<cr>

let g:nerdtree_tabs_autofind = 1

let NERDTreeShowHidden=1

" ==================== Ag =========================
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Gcd <bar> Ack!

" ==================== vim-json ====================
let g:vim_json_syntax_conceal = 0

" ==================== markdown ====================
let g:vim_markdown_folding_disabled = 1
let vim_markdown_preview_toggle=2
let vim_markdown_preview_hotkey='<C-m>'

au BufNewFile,BufRead *.md
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set foldlevel=99 |
    \ set foldmethod=indent

autocmd CursorHold,CursorHoldI *.md update

" " ===================== coc =======================
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" " Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight symbol under cursor on CursorHold

" " autocmd FileType go CursorHold * silent call CocActionAsync('highlight')

" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" function! SetupCommandAbbrs(from, to)
"   exec 'cnoreabbrev <expr> '.a:from
"         \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
"         \ .'? ("'.a:to.'") : ("'.a:from.'"))'
" endfunction

" " Use C to open coc config
" call SetupCommandAbbrs('C', 'CocConfig')

" ==================== vim-bookmarks ====================
let g:bookmark_highlight_lines = 1
let g:bookmark_no_default_key_mappings = 1

nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>a <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll
nmap <Leader>kk <Plug>BookmarkMoveUp
nmap <Leader>jj <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine


" ==================== AsyncRun ====================
let g:asyncrun_open = 6


" ==================== jedi-vim ====================
" ==================== Various other plugin settings ====================

nmap <C-T> :TagbarToggle<CR>

nmap  -  <Plug>(choosewin)

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Replace selected text with C-r
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Go to the file under cursor

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
