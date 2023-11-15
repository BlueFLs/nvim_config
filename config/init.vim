"common set
"set guifont=FiraCode\ Nerd\ Font\ Mono:h12:cANSI:qDRAFT
set guifont=CaskaydiaCove\ NFM:h12:cANSI:qDRAFT
"set guifont=ComicShannsMono\ Nerd\ Font\ Mono:h13:cANSI:qDRAFT
set guioptions-=m
set guioptions-=T
set guioptions-=e
set guioptions-=L
set guioptions-=r
set fileencodings=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8
set fileformat=unix
set noswapfile
set autoread
set title
set relativenumber
set number
set cursorcolumn
set cursorline
set tabstop=2
set shiftwidth=2
set laststatus=2
set expandtab
set smartindent
set autochdir
set ignorecase
set foldmethod=indent
set nofoldenable
set termguicolors
set wildmode=longest,list
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~

syntax enable
syntax on
filetype on

set novisualbell
set nocompatible
set backspace=indent,eol,start

let g:mapleader=" "

"set pythonthreehome=D:\sofware\anaconda3
"set pythonthreedll=D:\sofware\anaconda3\python311.dll

vnoremap <C-y> "+y
nnoremap <C-p> "+p

"window
noremap <c-h> :vertical res +10<cr>
noremap <c-l> :vertical res -10<cr>

"Pluglist"
call plug#begin('D:\software\neovim\plug')

Plug 'Lenovsky/nuake'
Plug 'preservim/tagbar'
Plug 'sainnhe/everforest'
Plug 'liuchengxu/vim-which-key'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mg979/vim-xtabline'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'nine2/vim-copyright'
Plug 'HonkW93/automatic-verilog'
Plug 'Yggdroot/LeaderF', {'do': './instal1.sh'}
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-smooth-scroll'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'RRethy/vim-illuminate'
Plug 'ojroques/vim-scrollstatus'
Plug 'gcmt/wildfire.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'sainnhe/sonokai'
Plug 'gagoar/StripWhiteSpaces'
Plug 'MTDL9/vim-log-highlighting'
Plug 'mhinz/vim-signify'
call plug#end()

"theme
"set backgroup=dark
"leg g:everforest_background='soft'
let g:everforest_enable_italic=1
let g:everforest_curosr='red'
colorscheme everforest



"undotree
nnoremap <F5> :undotreeToggle<CR>

"indentline
let g:indentLine_fileTypeExclude=['coc-explorer', 'startify']
let g:indentLine_enable=1

"airline
let g:airline_theme='random'
let g:airline_powerline_fonts=1

"tab
nnoremap <tab> gt

"leaderf
let g:Lf_Ctags = 'D:/software/neovim/tools/ctags/ctags.exe'
let g:Lf_RootMarkers = ['.git','.root']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagsconf = 'D:/software/neovim/tools/gtag/share/gtags/gtags.conf'
let g:Lf_CacheDirectory = 'D:/software/neovim/gtags_cache'
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_UseCache = 0
let g:Lf_Previewcode = 1
let g:Lf_GtagsSouce = 0
let g:Lf_PythonVersion = 3

let g:Lf_WindowPosition = 'popup'
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "ComicShannsMono Nerd Font" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_PreviewInPopup = 1
let g:Lf_ShowDevIcons = 1

nnoremap <leader>l  : Leaderf! line<CR>
nnoremap <leader>r  : Leaderf! rg<CR>
nnoremap <leader>f  : Leaderf! file<CR>
nnoremap <leader>m  : Leaderf! mru<CR>
nnoremap <leader>b  : Leaderf! buffer<CR>
nnoremap <leader>tr : <C-U><C-R>=printf("Leaderf! gtags -r %s", expand("<cword>"))<CR><CR>
nnoremap <leader>tg : <C-U><C-R>=printf("Leaderf! gtags -g %s", expand("<cword>"))<CR><CR>
nnoremap <leader>td : <C-U><C-R>=printf("Leaderf! gtags -d %s", expand("<cword>"))<CR><CR>

"rainbow
let g:rainbow_active = 1

"vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"coc.nvim
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-clangd',
      \ 'coc-vimlsp',
      \ 'coc-python',
      \ 'coc-explorer',
      \ 'coc-snippets',
      \ 'coc-yank']

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

set hidden
set nobackup
set nowritebackup

set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Add (Neo)Vim's native statusline support
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent><nowait> <space>o :<C-u>CocOutline<CR>

"coc-explorer
nnoremap <leader>e <Cmd>CocCommand explorer<CR>
"copyright
let g:file_copyright_auto_filetypes = [
        \ 'verilog', 'v', 'systemverilog', 'sv', 'py', 'python']

let g:file_copyright_name  = "tao.yong"
let g:file_copyright_email = "tao.yong@tugemedical.com"

let g:file_copyright_comment_prefix_map  = {
    \"python": "\#", "py":"\#",
    \"verilog": "\//", "v":"\//",
    \"systemverilog": "\//", "sv":"\//",
\}
let g:file_copyright_comment_mid_prefix_map  = {
    \"python": "\#", "py":"\#",
    \"verilog": "\//", "v":"\//",
    \"systemverilog": "\//", "sv":"\//",
\}
let g:file_copyright_comment_end_map  = {
    \"python": "\#", "py":"\#",
    \"verilog": "\//", "v":"\//",
    \"systemverilog": "\//", "sv":"\//",
\}

"xtabline
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.enable_presistance = 0
let g:xtabline_settings.enable_open_first = 1
let g:xtabline_settings.buffers_paths = 0
let g:xtabline_settings.current_tab_paths = 0
let g:xtabline_settings.other_tabs_paths = 0
let g:xtabline_lazy= 1

"easymotion
nmap <leader>s <Plug>(easymotion-s2)

"illuminate
let g:illuminate_delay = 750

augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi link illuminatedWord CursorLine
augroup END

augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
augroup END


"mundo
map <F5> :MundoToggle<CR>

"nuake
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>
let g:nuake_position = 'right'
let g:nuake_size = 0.5

"Startify

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction
let s:header= [
      \"▄▀▀▄ ▄▀▀▄  ▄▀▀█▀▄    ▄▀▀▄ ▄▀▄      ▄▀▀▄▀▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀█▄   ▄▀▀▄▀▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀▄▀▀▀▄ ",
      \"█   █    █ █   █  █  █  █ ▀  █     █   █   █ ▐  ▄▀   ▐ ▐ ▄▀ ▀▄ █   █   █ ▐  ▄▀   ▐ █   █   █ ",
      \"▐  █    █  ▐   █  ▐  ▐  █    █     ▐  █▀▀█▀    █▄▄▄▄▄    █▄▄▄█ ▐  █▀▀▀▀    █▄▄▄▄▄  ▐  █▀▀█▀  ",
      \"  █   ▄▀      █       █    █       ▄▀    █    █    ▌   ▄▀   █    █        █    ▌   ▄▀    █  ",
      \"   ▀▄▀     ▄▀▀▀▀▀▄  ▄▀   ▄▀       █     █    ▄▀▄▄▄▄   █   ▄▀   ▄▀        ▄▀▄▄▄▄   █     █   ",
      \"          █       █ █    █        ▐     ▐    █    ▐   ▐   ▐   █          █    ▐   ▐     ▐   ",
      \"          ▐       ▐ ▐    ▐                   ▐                ▐          ▐                  ",
      \"",
      \"",
      \"                                          ;::::;",
      \"                                        ;::::; :;",
      \"                                      ;:::::'   :;",
      \"                                     ;:::::;     ;.",
      \"                                    ,:::::'       ;           OOO\ ",
      \"                                    ::::::;       ;          OOOOO\ ",
      \"                                    ;:::::;       ;         OOOOOOOO",
      \"                                   ,;::::::;     ;'         / OOOOOOO",
      \"                                 ;:::::::::`. ,,,;.        /  / DOOOOOO",
      \"                               .';:::::::::::::::::;,     /  /     DOOOO",
      \"                              ,::::::;::::::;;;;::::;,   /  /        DOOO",
      \"                             ;`::::::`'::::::;;;::::: ,#/  /          DOOO",
      \"                             :`:::::::`;::::::;;::: ;::#  /            DOOO",
      \"                             ::`:::::::`;:::::::: ;::::# /              DOO",
      \"                             `:`:::::::`;:::::: ;::::::#/               DOO",
      \"                              :::`:::::::`;; ;:::::::::##                OO",
      \"                              ::::`:::::::`;::::::::;:::#                OO",
      \"                              `:::::`::::::::::::;'`:;::#                O",
      \"                               `:::::`::::::::;' /  / `:#",
      \"                                ::::::`:::::;'  /  /   `#",
      \]
let g:startify_change_to_dir = 1
let g:startify_custom_header = s:center(s:header)

"tagbar
let g:tagbar_type_systemverilog= {
    \ 'ctagstype' : 'systemverilog',
    \ 'kinds'     : [
        \'c:classes',
        \'t:tasks',
        \'f:functions',
        \'m:modules',
        \'i:interfaces',
        \'v:variables',
        \'d:defines',
        \'e:typedefs',
        \'a:parameters'
  \]
\}

nmap tg :TagbarToggle<CR>

let g:tagbar_autofocus = 1

"vim-which-key

let g:which_key_map = {}

nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:which_key_map.j = {
      \ 'name' : '+jump',
      \ '`'  : ['``', '本文上次跳转得地方'],
      \ '.'  : ['`.', '本文上次修改的地方'],
      \ '^'  : ['`^', '本文上次插入的地方'],
      \ '['  : ['`[', '本文上次修改/复制的起始地方'],
      \ ']'  : ['`]', '本文上次修改/复制的结束地方'],
      \ '<'  : ['`<', '本文上次高亮区开始的地方'],
      \ '>'  : ['`>', '本文上次高亮区结束的地方'],
      \ }

call which_key#register('<Space>', "g:which_key_map")


autocmd GUIEnter * simalt ~x

