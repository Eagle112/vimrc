if exists('g:vscode')
    packloadall
    nnoremap X "_X
    nnoremap x "_x

    nnoremap c "_c
    nnoremap dd "_dd
    nnoremap D "_D
    nnoremap d "_d
    vnoremap d "_d
    "vnoremap dd "_dd
    vnoremap c "_c
    vmap = <Cmd>call VSCodeNotifyVisual('editor.action.formatSelection',1)<CR><Esc><Esc>
    map p p`[V`]=<Esc>`]
    map P P`[V`]=<Esc>`]
    noremap <Tab> <Cmd>call VSCodeNotify('tab')<CR>
    nnoremap O i<Cmd>call VSCodeNotify('editor.action.insertLineBefore')<CR>
    nnoremap o i<Cmd>call VSCodeNotify('editor.action.insertLineAfter')<CR>
    noremap zb <Cmd>call VSCodeNotifyVisual('editor.action.blockComment',1)<CR>
    noremap za <Cmd>call VSCodeNotify('editor.action.jumpToBracket')<CR>
    noremap zc <Cmd>call VSCodeNotify('editor.fold')<CR>
    noremap zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
else
    call plug#begin('~/AppData/Local/nvim/plugged') 
    Plug 'junegunn/vim-easy-align'
    Plug 'mattn/emmet-vim'
    Plug 'tpope/vim-unimpaired'
    Plug 'preservim/nerdtree'
    call plug#end()
endif

map tt gT
nnoremap < <<
nnoremap > >>
"窗口移动
nmap <c-j> <c-w>j
nmap <c-h> <c-w>h  
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap ,h <c-w>H
nmap ,j <c-w>J
nmap ,k <c-w>K
nmap ,l <c-w>L
vmap y y`>
noremap <c-z> u
vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv
vnoremap < <gv      
vnoremap > >gv  
map * *zz
map # #zz
map n nzz
map N Nzz

nnoremap v' vi'
nnoremap v" vi"
nnoremap v( vi(
nnoremap v) vi)
nnoremap v[ vi[
nnoremap v] vi]
nnoremap v{ vi{
nnoremap v} vi}

nnoremap y' yi'
nnoremap y" yi"
nnoremap y( yi(
nnoremap y) yi)
nnoremap y[ yi[
nnoremap y] yi]
nnoremap y{ yi{
nnoremap y} yi}

nnoremap c' ci'
nnoremap c" ci"
nnoremap c( ci(
nnoremap c) ci)
nnoremap c[ ci[
nnoremap c] ci]
nnoremap c{ ci{
nnoremap c} ci}

nnoremap d' di'
nnoremap d" di"
nnoremap d( di(
nnoremap d) di)
nnoremap d[ di[
nnoremap d] di]
nnoremap d{ di{
nnoremap d} di}

noremap H ^
noremap L $
"map <A-j> <c-d>
"map <A-k> <c-u>
set mouse=a
set noendofline 
set clipboard=unnamedplus
"set smartindent

set foldenable
set ignorecase
set smartcase

function Cond(cond,...)
    let opts = get(a:000,0,{})
    return a:cond ? opts : extend(opts,{'on':[],'for':[]})
endfunction
let mapleader=" "
 
"function! s:openVSCodeCommandsInVisualMode()
"    normal! gv
"    let visualmode = visualmode()
"    if visualmode == "V"
"        let startLine = line("v")
"        let endLine = line(".")
"        " 最后一个参数 1 表示操作后仍处于选择模式，0 则表示操作后退出选择模式
"        call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
"    else
"        let startPos = getpos("v")
"        let endPos = getpos(".")
"        call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
"    endif
"endfunction

" workaround for calling command picker in visual mode
"xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

call plug#begin('~/AppData/Local/nvim/plugged') 
    Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
    " use vscode easymotion when in vscode mode
    Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-surround'
call plug#end()

autocmd InsertLeave * :silent !D:/chrome下载/im-select.exe 1033
autocmd InsertEnter * :silent !D:/chrome下载/im-select.exe 2052
"----------easymotion configuration --------------------------------
let g:EasyMotion_smartcase=1
let g:EasyMotion_keys='asdfghjklqweruiop;zxcvnm'
let g:EasyMotion_do_mapping=0
let g:EasyMotion_grouping=2
map <Leader> <Plug>(easymotion-prefix)
map <Leader>s <Plug>(easymotion-s)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)