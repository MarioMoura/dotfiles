"
" __     _____ __  __ ____   ____
" \ \   / /_ _|  \/  |  _ \ / ___|
"  \ \ / / | || |\/| | |_) | |
"  _\ V /  | || |  | |  _ <| |___
" (_)\_/  |___|_|  |_|_| \_\\____|

"=============================================================
" General Options
"=============================================================
set number									" set the line number on the sidebar
set relativenumber							" adjust the line number to be relative
set hidden									" allow buffers to be hidden
syntax on
set tabstop=4								" set tab length
set noexpandtab								" do not transform tabs in spaces
set shiftwidth=4							" also tab length"
set clipboard=unnamedplus					" set yank register to system clipboard
set smartindent								" automatically indent C-like files
set autoindent								" copy indent when creating a new line
set ignorecase								" search ignore case
set smartcase								" if uppercase ignore ignore case
set incsearch								" real-time pattern matching
set hlsearch								" highlight search
set encoding=utf-8
setglobal fileencoding=utf-8
set cmdheight=1								" vim cmd prompt height(redundant)
set linebreak								" visually break lines
set breakindent								" indent line breaks
set list lcs=tab:\ \ 						" intentional space after '\'; set tab appearance
hi SpecialKey ctermfg=245
set undodir=$HOME/.vim/undodir				" undo directory location
set undofile								" activate undo
set wildmenu								" menu autocomplete visualization
set mouse=a									" allow multiple mouse usages
set nocompatible							" do not provide backwards compatibility with vi
set conceallevel=3							" set the conceal level to total
set scrolloff=999							" cursor always in the middle of the screen
let mapleader = " "
set shortmess=filnwxtToO
set cursorline

filetype plugin indent on
highlight Conceal ctermfg            = 6 ctermbg   = 16
highlight Folded ctermfg             = 7 ctermbg   = 16
highlight Pmenu ctermbg              = 234 ctermfg = 255
highlight jsObjectKey ctermfg        = 60
highlight jsObjectValue ctermfg      = 144
highlight jsxExpressionBlock ctermfg = 144

"=============================================================
" Vundle
"=============================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ap/vim-buftabline'
Plugin 'mcchrish/nnn.vim'
Plugin 'scrooloose/nerdcommenter'

"Plugin 'valloric/youcompleteme'
Plugin 'neoclide/coc.nvim'

Plugin 'alvan/vim-closetag'
Plugin 'jeetsukumaran/vim-filesearch'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'severin-lemaignan/vim-minimap'
Plugin 'mariomoura/nerdtree'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ryanoasis/vim-devicons'
Plugin 'instant-markdown/vim-instant-markdown', {'rtp': 'after'}

Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'godlygeek/tabular'

Plugin 'Galooshi/vim-import-js'


"Plugin 'sheerun/vim-polyglot'
"Plugin 'chemzqm/vim-jsx-improve'

call vundle#end()

"=============================================================
" Mappings
"=============================================================
nnoremap <C-q> :bdelete<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
nnoremap + <C-W>+
nnoremap _ <C-W>-

nnoremap <F3> :noh<CR>
nnoremap <F6> :call MySpellLang()<CR>
inoremap <F6> <esc>:call MySpellLang()<CR>a
nnoremap <F12> :filetype detect<CR>
inoremap <F12> <Esc>:filetype detect<CR>a

nnoremap <leader>l $
nnoremap <leader>h ^
nnoremap <leader>q :bdelete<CR>
nnoremap <leader>ss :up<CR>
nnoremap <leader><Space> o<Esc>
nnoremap <leader>' viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>ee :vsplit $MYVIMRC<CR>
nnoremap <leader>es :so $MYVIMRC<CR>
nnoremap <leader>tt :call TabIndentToogle()<CR>
nnoremap <leader>mk :call Make()<CR>
nnoremap <leader>tk :call Togglekeys()<CR>
nnoremap <leader>nn :call NERDTreeToggleAndRefresh()<CR>
nnoremap <leader>tt :! st & disown<CR><CR>

nnoremap <leader>pp  :CtrlP<CR>
nnoremap <leader>pb  :CtrlPBuffer<CR>

nnoremap <C-f>w :call FindWord()<CR>
nnoremap <C-f>f :call FindFile()<CR>

inoremap jk <esc>
inoremap . .<c-g>u
inoremap , ,<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u

" line moving
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" st is configured to return Ω and α on <S-space> and <C-space>
inoremap <expr> Ω pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <expr> α pumvisible() ? "\<C-p>" : coc#refresh()
nnoremap Ω :CocAction<cr>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>r <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"===================== Objects ===============================
onoremap p i(
onoremap b i[
onoremap k i{

onoremap P a(
onoremap B a[
onoremap K a{

onoremap q i"
onoremap Q a"

onoremap h ^
onoremap l $

nnoremap gqq gqgq

nnoremap ghp :GitGutterPreviewHunk<CR>
nnoremap ghs :GitGutterStageHunk<CR>
nnoremap ghu :GitGutterUndoHunk<CR>
noremap <C-g> :GitGutterSignsToggle<CR>
nnoremap [c :GitGutterPrevHunk<CR>
nnoremap ]c :GitGutterNextHunk<CR>

" reeducation
"inoremap <esc> <nop>
"inoremap <Up> <Up>
"inoremap <Down> <Down>
"inoremap <Right> <Right>
"inoremap <Left> <Left>


"=============================================================
" Abbreviations
"=============================================================

iabbrev @@ mario@mariomoura.com
iabbrev <@@> <mario@mariomoura.com>


"=============================================================
" Plugins Conf
"=============================================================

"========================== CoC ==============================
let g:coc_global_extensions = ['coc-tsserver']
let g:coc_global_extensions += ['coc-eslint']
"======================= BufTabLine ==========================
let g:buftabline_show=1
"================= Instant Markdown config ===================

let g:instant_markdown_slow = 0
let g:instant_markdown_browser = "firefox --new-window"

"===================== Polyglot config =======================

let g:polyglot_disabled = ['javascript', 'jsx', 'javascriptreact']

"======================= CtrlP config ========================

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*
let g:ctrlp_max_files = 5000
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_map = ''
"====================== UltiSnips conf =======================

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-s>"

"====================== NerdTree conf ========================

let NERDTreeMapActivateNode='l'
let NERDTreeMapCloseDir='h'
let NERDTreeMapUpdir='H'
"let NERDTreeMapChangeRoot='r'
let g:NERDTreeDisableDefaultMenu = 1
let NERDTreeMenuQuit = 'q'
augroup NERDTree
	autocmd!
	autocmd VimEnter * call NERDTreeAddMenuSeparator()
	autocmd VimEnter * call NERDTreeAddMenuItem({'text': 'f: create a (f)ile', 'shortcut': 'f', 'callback': 'NERDTreeAddNode'})
	autocmd VimEnter * call NERDTreeAddMenuItem({'text': 'x: delete file', 'shortcut': 'x', 'callback': 'NERDTreeDeleteNode'})
	autocmd VimEnter * call NERDTreeAddMenuItem({'text': 'v: move file', 'shortcut': 'v', 'callback': 'NERDTreeMoveNode'})
	autocmd VimEnter * call NERDTreeAddMenuItem({'text': 'p: copy file', 'shortcut': 'p', 'callback': 'NERDTreeCopyNode'})
	autocmd VimEnter * call NERDTreeAddMenuItem({'text': 'l: list node', 'shortcut': 'l', 'callback': 'NERDTreeListNode'})

	autocmd VimEnter * call NERDTreeAddKeyMap({'key':'x','callback':'NERDTreeDeleteNode','quickhelpText':'delete node'})
augroup END
function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

"======================= Vimtex conf =========================
let g:tex_flavor='latex'
let g:tex_conceal='abdmg'
let g:vimtex_enabled=1
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_fold_enabled=1

"======================= NNN conf ============================
let g:nnn#command = 'DISABLE_FILE_OPEN_ON_NAV=1 nnn -e'
let g:nnn#layout = { 'left': '~15%' }

"===================== Airline conf ==========================
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1
"let g:airline_right_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_left_alt_sep= ''
"let g:airline_left_sep = ''
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#default#section_truncate_width = {}

"==================== YouCompleteMe conf =====================
let g:ycm_filter_diagnostics = { "c": { "level": "warning", }}
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_filetype_blacklist = { 'tex' : 1 }
let g:ycm_log_level = 'error'
let g:ycm_auto_hover=""
let g:ycm_key_list_select_completion = ['<C-space>', '<S-space>']
let g:ycm_use_ultisnips_completer = 1
let g:ycm_filetype_specific_completion_to_disable = { 'tex':1 }
let g:ycm_autoclose_preview_window_after_completion = 1

"====================== Closetag conf ========================
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

"====================== GitGutter conf =======================
set updatetime=100
let g:gitgutter_signs= 0
let g:gitgutter_map_keys = 0
let g:gitgutter_close_preview_on_escape= 1
let g:gitgutter_async= 1


"=============================================================
" Auto Cmds
"=============================================================
augroup view
	autocmd!
	autocmd BufWritePost *.* mkview
	autocmd BufLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview
augroup END

augroup c_custom
	autocmd!
augroup END

augroup tex
	autocmd!
	autocmd Filetype tex let g:vimtex_enabled=1
	autocmd FileType tex nnoremap <buffer> <leader>we viw<esc>a <left>}<right><esc>xbbi\emph{<esc>
	autocmd FileType tex nnoremap <buffer> <leader>wb viw<esc>a <left>}<right><esc>xbbi\textbf{<esc>
	autocmd FileType tex nnoremap <buffer> <leader>b :exe "!biber" expand('%:r')<CR>
	autocmd FileType tex nnoremap <buffer> <leader>C :exe "!pdflatex" expand('%')<CR>
	autocmd FileType tex nnoremap <buffer> <leader>v :VimtexView<CR>
	autocmd FileType tex set textwidth=65
	autocmd FileType tex let ycm_min_num_identifier_candidate_chars = 99
	" Portuguese
	autocmd FileType tex iabbrev nao não
	autocmd FileType tex iabbrev eh é
	autocmd FileType tex iabbrev ah à
	autocmd FileType tex iabbrev q que
augroup END

augroup js
	autocmd!
	autocmd FileType javascript set filetype=javascriptreact
	"autocmd BufWritePre *.js ImportJSFix 
	autocmd FileType javascriptreact set foldmethod=syntax "syntax highlighting items specify folds  
	autocmd FileType javascriptreact set foldlevelstart=99 "start file with all folds opened
augroup END

augroup misc
	autocmd!
	autocmd BufWritePost sxhkdrc !restart_sxhkd.sh
	autocmd BufWritePost *.snippets :call UltiSnips#RefreshSnippets()
augroup END

"=============================================================
" Tab Indent
"=============================================================
function! TabIndentOff()
	set list lcs=tab:\ \ "intentional space
	hi SpecialKey ctermfg=245
	echomsg "Tab Color Off !"
	let b:tabindent=0
endfunction

function! TabIndentOn()
	set list lcs=tab:\ǀ\ "intentional space
	hi SpecialKey ctermfg=245
	echomsg "Tab Color On !"
	let b:tabindent=1
endfunction
let b:tabindent=1
function! TabIndentToogle()
	if b:tabindent
		call TabIndentOff()
	else
		call TabIndentOn()
	endif
endfunction

"=============================================================
" Ycm Warn Toggle
"=============================================================
function! YcmWarnOff()
	set cmdheight=2
	let b:ycm_filter_diagnostics = { "c": { "level": "warning", }}
	YcmRestartServer
	echomsg "Ycm Warning disabled !"
	let b:ycmwarn=0
	set cmdheight=1
endfunction

function! YcmWarnOn()
	set cmdheight=2
	let b:ycm_filter_diagnostics = {}
	YcmRestartServer
	echomsg "Ycm Warning enabled !"
	let b:ycmwarn=1
	set cmdheight=1
endfunction
let b:ycmwarn=0
function! YcmWarnToogle()
	if b:ycmwarn
		call YcmWarnOff()
	else
		call YcmWarnOn()
	endif
endfunction


"=============================================================
" Auto Latex
"=============================================================
function! LatexOn()
	exe "autocmd BufWritePost " expand("%") " !pdflatex " expand("%")
	echomsg "Latex auto compilation on"
	let b:latex=1
endfunction

function! LatexOff()
	exe "autocmd! BufWritePost " expand("%")
	echomsg "Latex auto compilation off"
	let b:latex=0
endfunction
let b:latex=0
function! Latex()
	if b:latex
		call LatexOff()
	else
		call LatexOn()
	endif
endfunction

"=============================================================
" Auto Make
"=============================================================
function! MakeOn()
	exe "autocmd BufWritePost " expand("%") " !make"
	echomsg "make auto compilation on"
	let b:make=1
endfunction

function! MakeOff()
	exe "autocmd! BufWritePost " expand("%")
	echomsg "make auto compilation off"
	let b:make=0
endfunction
let b:make=0
function! Make()
	if b:make
		call MakeOff()
	else
		call MakeOn()
	endif
endfunction

"=============================================================
" Special keys
"=============================================================
function! Mykeyson()
	echomsg "Special keys on"
	let b:mykeys=1
	inoremap ~a ã
	inoremap 'e é
	inoremap 'a á
	inoremap `a à
	inoremap ^a â
	inoremap ^e ê
	inoremap 'i í
	inoremap ^i î
	inoremap ^o ô
	inoremap 'o ó
	inoremap ~o õ
	inoremap ^u û
	inoremap 'u ú
	inoremap cc ç

	inoremap ~A Ã
	inoremap 'A Á
	inoremap `A À
	inoremap ^A Â
	inoremap 'E É
	inoremap ^E Ê
	inoremap 'I Í
	inoremap ^I Î
	inoremap ^O Ô
	inoremap 'O Ó
	inoremap ~O Õ
	inoremap ^U Û
	inoremap 'U Ú
endfunction

function! Mykeysoff()
	echomsg "Special keys off"
	let b:mykeys=0
	iunmap ~a
	iunmap 'e
	iunmap `a
	iunmap 'a
	iunmap ^a
	iunmap ^e
	iunmap ^i
	iunmap 'i
	iunmap ^o
	iunmap 'o
	iunmap ~o
	iunmap ^u
	iunmap 'u
	iunmap cc

	iunmap ~A
	iunmap 'A
	iunmap `A
	iunmap ^A
	iunmap 'E
	iunmap ^E
	iunmap 'I
	iunmap ^I
	iunmap ^O
	iunmap 'O
	iunmap ~O
	iunmap ^U
	iunmap 'U
endfunction

let b:mykeys=0
function! Togglekeys()
	if b:mykeys
		call Mykeysoff()
	else
		call Mykeyson()
	endif
endfunction


"=============================================================
" FileSearch Config
"=============================================================

function! FindWord()
	let b:my_word = expand('<cword>')
	exe "Fsgrep " b:my_word
endfunction

function! FindFile()
	let b:my_word = expand('<cword>')
	exe "Fsfind " b:my_word
endfunction


"=============================================================
" Language Config
"=============================================================
let b:myLang = 0
let b:myLangList = ['nospell', 'en', 'pt', 'pt,en']
function! MySpellLang()
	"loop through languages
	if b:myLang == 0 | set nospell | endif
	if b:myLang > 0 | let &spelllang = b:myLangList[b:myLang] | set spell | endif
	echomsg 'language:' b:myLangList[b:myLang]
	let b:myLang = b:myLang + 1
	if b:myLang >= len(b:myLangList) | let b:myLang = 0 | endif
endfunction
