" 管理插件的插件
call plug#begin('~/.vim/plugged')
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'suan/vim-instant-markdown'
Plug 'dart-lang/dart-vim-plugin', { 'do': 'pub global activate dart_language_server' }
Plug 'mauritsvdvijgh/flutter-reload.vim'
Plug 'natebosch/vim-lsc'
Plug 'tomasr/molokai'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dumuzhou/emmet-vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer --java-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi'
Plug 'w0rp/ale', { 'do': 'yarn global add prettier' }
Plug 'chemzqm/vim-jsx-improve'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mhinz/vim-signify'
call plug#end()

# colorscheme molokai
# call glaive#Install()
# Glaive codefmt plugin[mappings]
# Glaive codefmt google_java_executable="java -jar /java/google-java-format-1.7-all-deps.jar"
augroup autoformat_settings
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
augroup END

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'

" md

" dart
" Bundle "thosakwe/vim-flutter"
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:lsc_auto_map = v:true
let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}
let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}
let g:lsc_auto_map = {
      \ 'GoToDefinition': '<C-]>',
      \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
      \ 'FindReferences': 'gr',
      \ 'NextReference': '<C-n>',
      \ 'PreviousReference': '<C-p>',
      \ 'FindImplementations': 'gI',
      \ 'FindCodeActions': 'ga',
      \ 'Rename': 'gR',
      \ 'ShowHover': v:true,
      \ 'DocumentSymbol': 'go',
      \ 'WorkspaceSymbol': 'gS',
      \ 'SignatureHelp': '<C-m>',
      \ 'Completion': 'omnifunc',
      \}

" 配色
filetype indent on
filetype plugin indent on
filetype on
syntax on
set t_Co=256
let g:molokai_original = 0

" air-line
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" html补全
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" 代码补全
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ["<c-n>", "<Down>"]
let g:ycm_key_list_previous_completion = ["<c-p>", "<Up>"]

" 文件夹和注释

" svn和git提示


" 语法错误提示
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'typescript': [''],
      \   'go': ['gofmt', 'golint', 'govet', 'gopls'],
      \   'dart': ['language_server']
      \}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEErrorSign ctermbg=235

" 代码变动不检查
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" 代码格式化
let g:ale_fixers = {
      \   'html': ['prettier'],
      \   'css': ['prettier'],
      \   'json': ['prettier'],
      \   'javascript': ['prettier'],
      \   'typescript': ['prettier'],
      \   'go': ['gofmt'],
      \   'dart': ['dartfmt'],
      \   'c': ['clang-format'],
      \   'java': ['google_java_format'],
      \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

" jsx高亮和缩进
let g:jsx_ext_required = 0

" typescript
let g:typescript_ignore_browserwords = 1
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript

" 缩进
set ai
set ci
set number
set bs=2
set noet
set sw=2
set sw=2
set ts=2
set completeopt=preview,menu
set autochdir
set expandtab

" 字符
set fileencodings=uft-8,gbk
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set termencoding=utf-8
set clipboard=unnamed

" 文件类型设置
autocmd BufNewFile,BufRead *.vue set filetype=html
autocmd BufNewFile,BufRead *.wxml set filetype=javascript
autocmd BufNewFile,BufRead *.wxss set filetype=css
autocmd BufNewFile,BufRead *.dart set filetype=dart
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd BufRead,BufNewFile *.tsx setlocal syntax=typescript.javascript
autocmd FileType html setlocal omnifunc=javascriptcomplete#CompleteJS
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" 不生成备份文件
set nobackup nowritebackup noswapfile

" 快捷键
" map <CR> :call tern#Enable()<CR>
imap <tab> <c-r>=MyTabFunction()<cr>
nmap B :call Jsbeau()<CR>
nmap Dir :NERDTreeMirror<CR>
nmap Dir :NERDTreeToggle<CR>
nmap Html :setlocal omnifunc=tern#Complete<CR> :set filetype=html<CR>
nmap Css :setlocal omnifunc=csscomplete#CompleteCSS<CR> :set filetype=css<CR>
nmap Js :setlocal omnifunc=tern#Complete<CR> :set filetype=javascript<CR>
nmap Q <leader>cc
nmap W <leader>cu
nmap Nb :set number <CR>
nmap Nnb :set nonumber <CR>
nmap P :set paste <CR>
nmap F gg = G
nmap Np :set nopaste <CR>
nmap r :call Run()<CR>


" buffer快速导航
nnoremap <Leader>a :YcmCompleter GoTo<CR>
nnoremap <Leader>f :bp<CR>
nnoremap <Leader>b :bn<CR>
nnoremap <Leader>b :bn<CR>
nnoremap <Leader>q :YcmCompleter OrganizeImports<CR>
nnoremap <Leader><Leader> :YcmCompleter Format<CR>

" 查看buffers
" left bbb = 'bp<bar>bd #'
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>d :bp<bar>bd #<CR>

" 切换buffers
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" 运行
func! Run()
  let file = expand("%")
  if stridx(file,".js")>-1
    exec "w"
    exec "! clear && node %<"
  endif
  if stridx(file,".ts")>-1
    exec "w"
    exec "! clear && ts-node %"
  endif
  if stridx(file,".go")>-1
"    exec "w"
"     exec "! clear && go run %"
    exec "! curl http://127.0.0.1:6666/%<"
  endif
  if stridx(file,".dart")>-1
    exec "w"
    exec "! clear && dart --enable-asserts %"
  endif
  if stridx(file,".java")>-1
    exec "w"
    exec "! clear && javac % && java %<"
  endif
  if stridx(file,".c")>-1
    exec "w"
    exec "! clear && gcc % && ./a.out"
  endif
  if stridx(file,".m")>-1
    exec "w"
    exec "! clear && gcc % -o objc -ObjC -framework Foundation && ./objc"
  endif
endfunc

" tab补全
function! MyTabFunction ()
  let line = getline(".")
  let substr = strpart(line, -1, col(".")+1)
  let substr = matchstr(substr, "[^ \t]*$")
  if strlen(substr) == 0
    return "\<tab>"
  endif
  return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
endfunction

" brew install cmake go
