"common set
set guifont=ComicShannsMono\ Nerd\ Font:h13
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
set clipboard+=unnamedplus
set wildmode=longest,list

syntax on
filetype on

let g:mapleader=" "
let g:python3_host_skip_check=1
let g:python_host_skip_check=1
let g:python3_host_prog="xxx\python.exe"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if has('nvim')
  try
    call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
    call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
  catch
  endtry
endif


"
noremap <c-h> :vertical res +10<cr>
noremap <c-l> :vertical res -10<cr>


"novide"
let g:neovide_transparency=0.99
let g:neovide_cursor_vfx_mode = "railgun"

"Pluglist"
call plug#begin('xxx')

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
Plug 'Yggdroot/LeaderF', {'do': './instal1.sh'}
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-smooth-scrol1'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'RRethy/vim-illuminate'
Plug 'ojroques/vim-scrollstatus'
Plug 'gcmt/wildfire.vim'
Plug 'bfredl/nvim-miniyank'
Plug 'simnalamburt/vim-mundo'
Plug 'sainnhe/sonokai'
Plug 'gagoar/StripWhiteSpaces'
Plug 'MTDL9/vim-log-highlighting'
Plug 'mhinz/vim-signify'
call plug#end()

"theme
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
let g:Lf_Ctags = '...\ctags.exe'
let g:Lf_RootMarkers = ['.root']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagsconf = '..\gtags.conf'
let g:Lf_CacheDirectory = '..\gtags'
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
nmap <leader>s <Plus>(easymotion-s2)

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

"miniyank
map P <Plug>(miniyank-autoput)
map p <Plug>(miniyank-autoPut)

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

let g:tagbar_type_systemverilog = {
    \ 'ctagstype': 'systemverilog',
    \ 'kinds' : [
         \'A:assertions',
         \'C:classes',
         \'E:enumerators',
         \'I:interfaces',
         \'K:packages',
         \'M:modports',
         \'P:programs',
         \'Q:prototypes',
         \'R:properties',
         \'S:structs and unions',
         \'T:type declarations',
         \'V:covergroups',
         \'b:blocks',
         \'c:constants',
         \'e:events',
         \'f:functions',
         \'m:modules',
         \'n:net data types',
         \'p:ports',
         \'r:register data types',
         \'t:tasks',
     \],
     \ 'sro': '.',
     \ 'kind2scope' : {
        \ 'K' : 'package',
        \ 'C' : 'class',
        \ 'm' : 'module',
        \ 'P' : 'program',
        \ 'I' : 'interface',
        \ 'M' : 'modport',
        \ 'f' : 'function',
        \ 't' : 'task',
     \},
     \ 'scope2kind' : {
        \ 'package'   : 'K',
        \ 'class'     : 'C',
        \ 'module'    : 'm',
        \ 'program'   : 'P',
        \ 'interface' : 'I',
        \ 'modport'   : 'M',
        \ 'function'  : 'f',
        \ 'task'      : 't',
     \ },
     \}


nmap tg :TagbarToggle<CR>

let g:tagbar_autofocus = 1

"vim-which-key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:which_key_map.j = {
      \ 'name' : '+jump',
      \ '``' : ['``', '本文上次跳转得地方'],
      \ '.'  : ['`.', '本文上次修改的地方'],
      \ '^'  : ['`^', '本文上次插入的地方'],
      \ '['  : ['`[', '本文上次修改/复制的起始地方'],
      \ ']'  : ['`]', '本文上次修改/复制的结束地方'],
      \ '<'  : ['`<', '本文上次高亮区开始的地方'],
      \ '>'  : ['`>', '本文上次高亮区结束的地方'],
      \ }

call which_key#register('<Space>', "g:which_key_map")


