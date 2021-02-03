" 插件
call plug#begin('~/.vim/plugged')
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-html coc-css coc-omnisharp coc-pyright coc-snippets coc-emmet coc-json coc-flutter coc-angular coc-vetur coc-java coc-json coc-prettier coc-git coc-go coc-clangd coc-rust-analyzer'}
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
"Plug 'mauritsvdvijgh/flutter-reload.vim'

" 代码片段
Plug 'dumuzhou/vim-snippets'

" 缩进和高亮
Plug 'tomasr/molokai'
Plug 'leafoftree/vim-vue-plugin'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'suan/vim-instant-markdown'
Plug 'dart-lang/dart-vim-plugin'
Plug 'Quramy/tsuquyomi'
Plug 'chemzqm/vim-jsx-improve'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'posva/vim-vue'

" 目录和注释
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

call plug#end()

let g:vim_vue_plugin_load_full_syntax = 1

" 记录上次打开文件位置
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" 配色
filetype indent on
filetype plugin indent on
filetype on
colorscheme molokai
syntax on
set t_Co=256
let g:molokai_original = 0

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" 代码补全
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ["<c-n>", "<Down>"]
let g:ycm_key_list_previous_completion = ["<c-p>", "<Up>"]

highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEErrorSign ctermbg=235

let g:jsx_ext_required = 0

" typescript
let g:typescript_ignore_browserwords = 1
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.tsx

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
set cc=80

" 字符
set fileencodings=uft-8,gbk
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set termencoding=utf-8
set clipboard=unnamed

" 文件类型设置
autocmd BufNewFile,BufRead *.vue set filetype=vue
autocmd BufNewFile,BufRead *.wxml set filetype=javascript
autocmd BufNewFile,BufRead *.wxss set filetype=css
autocmd BufNewFile,BufRead *.dart set filetype=dart
autocmd FileType scss setl iskeyword+=@-@
"autocmd FileType less setl iskeyword+=@-@
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
"imap l <c-r>=MyTabFunction()<cr>
nmap B :call Jsbeau()<CR>
nmap Dir :NERDTreeMirror<CR>
nmap Dir :NERDTreeToggle<CR>
nmap Q <leader>cc
nmap W <leader>cu
nmap Nb :set number <CR>
nmap Nnb :set nonumber <CR>
nmap P :set paste <CR>
nmap F gg = G
nmap Np :set nopaste <CR>
nmap r :call Run()<CR>


nmap <leader>rn <Plug>(coc-rename)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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

" allow to scroll in the preview
set mouse=a

" mappings
nnoremap <silent> <space><space> :<C-u>Rg<CR>
nnoremap <silent> <space>c :<C-u>CocFzfList<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>
nnoremap <silent> <space>g      :<C-u>GFiles<CR>
nnoremap <silent> <space>s      :<C-u>GFiles?<CR>
nnoremap <silent> <space>l      :<C-u>Lines<CR>
nnoremap <silent> <space>b      :<C-u>Buffers<CR>
nmap gc <Plug>(coc-git-commit)
" leetcode
nnoremap <Leader><Leader> :CocList LeetcodeProblems<CR>
nnoremap <Leader>r :CocCommand leetcode.run<CR>
nnoremap <Leader>s :CocCommand leetcode.submit<CR>
nnoremap <Leader>h :CocCommand leetcode.comments<CR>
" flutter
nnoremap <silent> <space>e      :<C-u>CocCommand flutter.emulators<CR>
nnoremap <silent> <space>r      :<C-u>CocCommand flutter.run<<CR>

" 运行
func! Run()
  let file = expand("%")
  if stridx(file,".js")>-1
    exec "w"
    exec "! clear && node %<"
  endif
  if stridx(file,".ts")>-1
    exec "w"
    "exec "! clear && ts-node %"
    exec "! clear && yarn start"
  endif
  if stridx(file,".go")>-1
     exec "w"
     exec "! clear && go run %"
"    exec "! curl http://127.0.0.1:8080/%<"
  endif
  if stridx(file,".dart")>-1
    exec "w"
    "exec "! clear && dart --enable-asserts %"
    exec "! clear && pub run ./index.dart"
  endif
  if stridx(file,".java")>-1
    exec "w"
    exec "! clear && javac % && java %<"
  endif
  if stridx(file,".py")>-1
    exec "w"
    exec "! clear && python3 %"
  endif
  if stridx(file,".rs")>-1
    exec "w"
    exec "! clear && cargo run"
  endif
  if stridx(file,".cs")>-1
    exec "w"
    exec "! clear && dotnet run"
  elseif stridx(file,".cpp")>-1
    exec "w"
    exec "! clear && g++ % && ./a.out"
  elseif stridx(file,".c")>-1
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
