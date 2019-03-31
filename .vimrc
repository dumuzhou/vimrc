
" 管理插件的插件
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle "gmarik/vundle"

" go
Bundle "fatih/vim-go"

" md
Bundle "suan/vim-instant-markdown"

" dart
Bundle "dart-lang/dart-vim-plugin"
Bundle "mauritsvdvijgh/flutter-reload.vim"
" Bundle "thosakwe/vim-flutter"
Bundle "natebosch/vim-lsc"
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
Bundle "tomasr/molokai"
filetype indent on
filetype plugin indent on
filetype on
syntax on
set t_Co=256
colorscheme molokai
let g:molokai_original = 0

" air-line
Bundle "edkolev/tmuxline.vim"
Bundle "vim-airline/vim-airline"
Bundle "vim-airline/vim-airline-themes"
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" html补全
Bundle "dumuzhou/emmet-vim"

Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" 代码补全
Bundle "Valloric/YouCompleteMe"
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ["<c-n>", "<Down>"]
let g:ycm_key_list_previous_completion = ["<c-p>", "<Up>"]

" 文件夹和注释
Bundle "The-NERD-tree"
Bundle "The-NERD-Commenter"

" svn和git提示
Bundle "mhinz/vim-signify"


" 语法错误提示
Bundle "w0rp/ale"
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'typescript': ['tslint'],
      \   'go': ['gofmt', 'golint', 'govet'],
      \   'dart': ['language_server']
      \}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEErrorSign ctermbg=235

" 代码变动不检查
" let g:ale_lint_on_text_changed = 'never'
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
Bundle "chemzqm/vim-jsx-improve"
Bundle "MaxMEllon/vim-jsx-pretty"
let g:jsx_ext_required = 0

" typescript
Bundle "leafgarland/typescript-vim"
Bundle "HerringtonDarkholme/yats.vim"
Bundle "Quramy/tsuquyomi"
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
    exec "! node %<"
  endif
  if stridx(file,".ts")>-1
    exec "w"
    exec "! ts-node %"
  endif
  if stridx(file,".go")>-1
    exec "w"
    exec "! go run %"
  endif
  if stridx(file,".dart")>-1
    exec "w"
    exec "! dart %"
  endif
  if stridx(file,".java")>-1
    exec "w"
    exec "! javac % && java %<"
  endif
  if stridx(file,".c")>-1
    exec "w"
    exec "! gcc % && ./a.out"
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
" git clone https://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle
" yarn global add  js-beautify eslint
" install.py --go-completer
" tern install
