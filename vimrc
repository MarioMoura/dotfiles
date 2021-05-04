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
set shortmess=a								" avoids all 'hit-enter' effects
set list lcs=tab:\ \ 						" intentional space after '\'; set tab appearance
hi SpecialKey ctermfg=245
set undodir=$HOME/.vim/undodir				" undo directory location
set undofile								" activate undo
set wildmenu								" menu autocomplete visualization
set mouse=a									" allow multiple mouse usages
set nocompatible							" do not provide backwards compatibility with vi
set conceallevel=3							" set the conceal level to total
let mapleader = " "
filetype plugin indent on
highlight Conceal ctermfg=6 ctermbg=16
highlight Folded ctermfg=6 ctermbg=16


"=============================================================
" Vundle
"=============================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mcchrish/nnn.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'valloric/youcompleteme'
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
Plugin 'sheerun/vim-polyglot'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'instant-markdown/vim-instant-markdown', {'rtp': 'after'}

call vundle#end()

"=============================================================
" Mappings
"=============================================================
nnoremap <C-q> :bdelete<CR>
nnoremap <C-x> :bdelete<CR>
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
nnoremap <leader>yw :call YcmWarnToogle()<CR>
nnoremap <leader>ml :call Latex()<CR>
nnoremap <leader>mk :call Make()<CR>
nnoremap <leader>kk :call Togglekeys()<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>t  :! st & disown<CR><CR>

nnoremap <C-n> :NnnPicker %:p:h<CR>
nnoremap <C-f>w :call FindWord()<CR>
nnoremap <C-f>f :call FindFile()<CR>

inoremap jk <esc>

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

"================= Instant Markdown config ===================

let g:instant_markdown_slow = 0
let g:instant_markdown_browser = "firefox --new-window"

"===================== Polyglot config =======================

let g:polyglot_disabled = ['javascript', 'jsx', 'javascriptreact']

"======================= CtrlP config ========================

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_map = '<leader>p'
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
let NERDTreeMapChangeRoot='r'
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

"======================= Vimtex conf =========================
let g:tex_flavor='latex'
let g:tex_conceal='abdmg'
let g:vimtex_enabled=1
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_fold_enabled=1

"======================= NNN conf ============================
let g:nnn#command = 'DISABLE_FILE_OPEN_ON_NAV=1 nnn -e'
let g:nnn#layout = { 'left': '~20%' }

"===================== Airline conf ==========================
let g:airline#extensions#tabline#enabled = 1
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
let g:airline_section_y='BN: %{bufnr("%")}'

"==================== YouCompleteMe conf =====================
let g:ycm_filter_diagnostics = { "c": { "level": "warning", }}
let g:ycm_min_num_of_chars_for_completion = 1
"let g:ycm_filetype_blacklist = { 'tex' : 1 }
let g:ycm_log_level = 'error'
let g:ycm_auto_hover=""
let g:ycm_key_list_select_completion = ['<C-space>', '<S-space>']

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
	autocmd BufWinLeave *.* mkview
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
	autocmd FileType tex nnoremap <buffer> <leader>c :exe "!pdflatex" expand('%')<CR>
	autocmd FileType tex nnoremap <buffer> <leader>v :VimtexView<CR>
	autocmd FileType tex iabbrev nao não
augroup END

augroup misc
	autocmd!
	autocmd BufWritePost sxhkdrc !restart_sxhkd.sh
	autocmd BufWritePost *.snippets :call UltiSnips#RefreshSnippets()
    autocmd FileType javascript set filetype=javascriptreact
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
