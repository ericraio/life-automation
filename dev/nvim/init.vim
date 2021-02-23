call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colors
Plug 'rafalbromirski/vim-aurora'

" Languages
Plug 'fatih/vim-go'
Plug 'tpope/vim-haml'
Plug 'stephpy/vim-yaml'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ajf/puppet-vim'
Plug 'rosstimson/scala-vim-support'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-git'
Plug 'timcharper/textile.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chrisbra/csv.vim'
Plug 'mmalecki/vim-node.js'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/Arduino-syntax-file'
Plug 'groenewege/vim-less'
Plug 'mityu/vim-applescript'
Plug 'wlangstroth/vim-haskell'
Plug 'slim-template/vim-slim'
Plug 'jimenezrick/vimerl'
Plug 'sunaku/vim-ruby-minitest'
Plug 'guns/vim-clojure-static'
Plug 'elixir-lang/vim-elixir'
Plug 'jnwhiteh/vim-golang'
Plug 'fatih/vim-go'
Plug 'buoto/gotests-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-liquid'
Plug 'depuracao/vim-rdoc'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'
Plug 'vim-test/vim-test'
Plug 'StanAngeloff/php.vim'
Plug 'prettier/vim-prettier'
Plug 'jparise/vim-graphql'
Plug 'dsawardekar/wordpress'

" Tools
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'
Plug 'metalelf0/supertab'
Plug 'itspriddle/ZoomWin'
Plug 'thoughtbot/vim-rspec'
Plug 'ericraio/vim-rspec2'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-endwise'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/vimwiki'
Plug 'ap/vim-css-color'
Plug 'Lokaltog/vim-easymotion'
Plug 'chrisbra/NrrwRgn'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'rgarver/Kwbd.vim'
Plug 'kien/ctrlp.vim'
Plug 'skalnik/vim-vroom'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-dispatch'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-visualstar'
Plug 'bronson/vim-trailing-whitespace'
Plug 'matze/vim-move'
Plug 'chr4/nginx.vim'
Plug 'spacewander/openresty-vim'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sebdah/vim-delve'

"Other Plugins
Plug 'tpope/vim-pathogen'
Plug 'wincent/command-t'

call plug#end()

" -------------------------------------------------------------------------------------------------
" general
" -------------------------------------------------------------------------------------------------
set relativenumber
set nowrap
set ts=2
set sts=2
set et     "expand tabs to spaces

" quickly resize windows with a vertical split:
:map - <C-W>-
:map + <C-W>+

"clearing highlighted searches
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>hs :nohlsearch<CR>

" http://nvie.com/posts/how-i-boosted-my-vim/
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Hardcore mode, disable arrow keys.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Move blocks of code up or down
nnoremap <C-k>   :<C-u>silent! move-2<CR>==
nnoremap <C-j> :<C-u>silent! move+<CR>==
xnoremap <C-k>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <C-j> :<C-u>silent! '<,'>move'>+<CR>gv=gv

" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" -------------------------------------------------------------------------------------------------
" colors
" -------------------------------------------------------------------------------------------------
set termguicolors
set background=dark
colorscheme aurora

"  syntax highlighting
au BufReadPost Dangerfile set syntax=ruby

" -------------------------------------------------------------------------------------------------
" plugins
" -------------------------------------------------------------------------------------------------

" nerdtree
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>N :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" airline
let g:airline_theme='simple'

" image
autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw

" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

" emmet
let g:user_emmet_leader_key=','
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/.snippets.json')), "\n"))

" Ctrl P
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


" -------------------------------------------------------------------------------------------------
" languages
" -------------------------------------------------------------------------------------------------

" Go
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor
let g:go_fmt_autosave = 1
let g:go_metalinter_enabled = ['vet', 'unused', 'deadcode', 'gosimple', 'typecheck', 'structcheck', 'errcheck', 'staticcheck', 'ineffassign', 'godot', 'nakedret', 'misspell', 'dogsled', 'unparam', 'depguard']
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
au BufWritePre,FileWritePre *.go :GoFmt
autocmd FileType go nnoremap <buffer> :A :GoAlternate<C-j>
autocmd FileType go nmap <C-t> <Plug>(go-test)

function FindSessionDirectory() abort
  if len(argv()) > 0
    return fnamemodify(argv()[0], ':p:h')
  endif
  return getcwd()
endfunction!

function GoLint()
        if stridx(FindSessionDirectory(),"sol") < 0
                autocmd BufWritePost,FileWritePost *.go execute 'GoMetaLinter' | cwindow
        endif
endfunction!

call GoLint()

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <C-b> :<C-u>call <SID>build_go_files()<CR>

" JavaScript
au BufWritePre,FileWritePre *.js,*.jsx,*.vue :PrettierAsync

" GraphQL
au BufNewFile,BufRead *.prisma setfiletype graphql

" YAML
if exists("b:did_indent")
  finish
endif
"runtime! indent/ruby.vim
"unlet! b:did_indent
let b:did_indent = 1

setlocal autoindent sw=2 et
setlocal indentexpr=GetYamlIndent()
setlocal indentkeys=o,O,*<Return>,!^F

function! GetYamlIndent()
  let lnum = v:lnum - 1
  if lnum == 0
    return 0
  endif
  let line = substitute(getline(lnum),'\s\+$','','')
  let indent = indent(lnum)
  let increase = indent + &sw
  if line =~ ':$'
    return increase
  else
    return indent
  endif
endfunction

" -------------------------------------------------------------------------------------------------
" tools
" -------------------------------------------------------------------------------------------------
let vim_markdown_preview_hotkey='<C-m>'

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

hi! CocErrorSign guifg=#d1666a
hi! CocInfoSign guibg=#353b45
hi! CocWarningSign guifg=#d1cd66
