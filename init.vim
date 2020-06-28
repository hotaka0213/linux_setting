"line number
set relativenumber
set number

"Commands
"Using :Setting for jump this file
command Setting :e $HOME/dotfiles/init.vim

"Key maps
"<Leader>
nmap <space> <Leader>


"python3
let g:python3_host_prog='/usr/bin/python3'

"Plugins
call plug#begin() "vim-plug
Plug 'easymotion/vim-easymotion' "move faster
"easymotion's config
 let g:EasyMotion_do_mapping = 0 "disable default mappings
   "s<char><char><prefix>
 nmap s <Plug>(easymotion-overwin-f2)
   "Line motions
 nmap <Leader>j <Plug>(easymotion-j)
 nmap <Leader>k <Plug>(easymotion-k)
   "search with easymotion
 map / <Plug>(easymotion-sn)
 omap / <plug>(easymotion-tn)
 map n <plug>(easymotion-next)
 map N <Plug>(easymotion-prev)
Plug 'Shougo/denite.nvim' "Merge Interface
"denite.nvim's config
"<Leader>da = display current directory and buffer
 nnoremap <silent><Leader>da :<C-u>Denite file buffer -split=floating file:new<CR>
"<Leader>db = display buffer
 nnoremap <silent><Leader>db :<C-u>Denite buffer -split=floating file:new<CR>
"<Leader>df = display current directory
 nnoremap <silent><Leader>df :<C-u>Denite file -split=floating file:new<CR>
"<Leader>dr = display current directory redirectly
 nnoremap <silent><Leader>dr :<c-u>Denite file/rec -split=floating file:new<CR>
"<Leader>dg = search string from current directory 
 nnoremap <silent><Leader>dg :<C-u>Denite grep -buffer-name=search<CR>
"<Leader>d, = search string under cursor from current directory
 nnoremap <silent><Leader>d, :<C-u>DeniteCursorWord grep -buffer-name=search line<CR>
"<Leader>ds = display previous grep search
 nnoremap <silent><Leader>ds :<C-u>Denite -resume -buffer-name=search<CR>
"<Leader>dc = display recently commands
 nnoremap <silent><Leader>dc :<C-u>Denite command_history -split=floating<CR>
"Key maps in Denite.nvim
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
   "<CR> or o = Open file
   nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
   nnoremap <silent><buffer><expr> o denite#do_map('do_action')
   "s = Split and open file
   nnoremap <silent><buffer><expr> s denite#do_map('do_action','split')
   "v = split Vertically and open file
   nnoremap <silent><buffer><expr> v denite#do_map('do_action','vsplit')
   "d = Delete file
   nnoremap <silent><buffer><expr> d denite#do_map('do_action','delete')
   "p = Preview file
   nnoremap <silent><buffer><expr> p denite#do_map('do_action','preview')
   "<Esc> or q = Quit denite.nvim
   nnoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
   nnoremap <silent><buffer><expr> q denite#do_map('quit')
   "f = Search file name
   nnoremap <silent><buffer><expr> f denite#do_map('open_filter_buffer')
   "<Space> = select file
   nnoremap <silent><buffer><expr> <space> denite#do_map('toggle_select').'j'
  endfunction
  autocmd FileType denite-filter call s:denite_filter_my_settings()
  function! s:denite_filter_my_settings() abort
   imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
  endfunction
Plug 'dense-analysis/ale' "check source code
"ale's setting
"check only with save
"let g:ale_lint_on_text_changed = 0
"setting about appearance
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
"<C-k> = next error/warning,<C-p> = previous error/warnings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
Plug 'Shougo/deoplete.nvim'
 let g:deoplete#enable_at_startup=1
Plug 'autozimu/LanguageClient-neovim',{'branch':'next','for':['c','cpp'],'do':'bash install.sh'} "c++ lsp
 "lsp-setting
 set hidden
 let g:LanguageClient_serverCommands = {
       \ 'cpp': ['clangd'],
       \ }
 let g:LanguageClient_loadSettings = 1
 let g:LanguageClient_hasSnippetSupport = 0
 
 set completefunc=LanguageClient#complete
 
 nnoremap K :call LanguageClient#textDocument_hover()<CR>
 nnoremap F :call LanguageClient#textDocument_formatting()<CR>

call plug#end()
