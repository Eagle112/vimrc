if exists('g:vscode')
    packloadall
    nnoremap X "_X
    nnoremap x "_x

    let mapleader=" "
    nnoremap <nowait> c "_c
    nnoremap dd "_dd
    nnoremap D "_D
    nnoremap <nowait> d "_d
    vnoremap <nowait> d "_d
    "vnoremap dd "_dd
    vnoremap c "_c
    vmap = <Cmd>call VSCodeNotifyVisual('editor.action.formatSelection',1)<CR><Esc><Esc>
    map P P`[V`]=<Esc>`]
    map p p`[V`]=<Esc>`]
    "noremap <Tab> <Cmd>call VSCodeNotify('tab')<CR>
    nnoremap O i<Cmd>call VSCodeNotify('editor.action.insertLineBefore')<CR>
    nnoremap o i<Cmd>call VSCodeNotify('editor.action.insertLineAfter')<CR>
    noremap z/ <Cmd>call VSCodeNotifyVisual('editor.action.blockComment',1)<CR>
    noremap za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
    nnoremap <leader>a <Cmd>call VSCodeNotify('editor.action.jumpToBracket')<CR>
    vnoremap <leader>a %
    noremap zc <Cmd>call VSCodeNotify('editor.fold')<CR>
    noremap zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
    noremap zf <Cmd>call VSCodeNotify('actions.find')<CR>
    nnoremap <C-up> <Cmd>call VSCodeNotifyVisual('editor.action.moveLinesUpAction',1)<CR>
    nnoremap <C-down> <Cmd>call VSCodeNotifyVisual('editor.action.moveLinesDownAction',1)<CR>
    vnoremap <C-down> <Esc>`<mY`>mZgv<Cmd>call VSCodeNotifyVisual('editor.action.moveLinesDownAction',1)<CR><Esc>`YjV`Zj
    vnoremap <C-up> <Esc>`<mY`>mZgv<Cmd>call VSCodeNotifyVisual('editor.action.moveLinesUpAction',1)<CR><Esc>
else
    set nu
    call plug#begin('~/AppData/Local/nvim/plugged') 
    Plug 'junegunn/vim-easy-align'
    Plug 'mattn/emmet-vim'
    Plug 'tpope/vim-unimpaired'
    Plug 'preservim/nerdtree'
    call plug#end()
endif
"默认进入插入模式
start
set scrolloff=3
let &t_TI = ""
let &t_TE = ""
noremap dF dvF
noremap dT dvT
noremap dH dv^

map tt gT
nnoremap < <<
nnoremap > >>
"窗口移动
map <c-w>f <c-w>b<c-w>w
nmap <c-j> <c-w>j
nmap <c-h> <c-w>h  
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <nowait> zh <c-w>H
nmap <nowait> zj <c-w>J
nmap <nowait> zk <c-w>K
nmap <nowait> zl <c-w>L
vmap y y`>
noremap <c-z> u
vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv
vnoremap < <gv      
vnoremap > >gv  
"noremap * * zz
"noremap # # zz
"noremap n n zz
"noremap N N zz

onoremap ' i'
onoremap " i"
onoremap ( i(
onoremap ) i)
onoremap [ i[
onoremap ] i]
onoremap { i{
onoremap } i}
onoremap <nowait> t it

"nnoremap y' yi'
"nnoremap y" yi"
"nnoremap y( yi(
"nnoremap y) yi)
"nnoremap y[ yi[
"nnoremap y] yi]
"nnoremap y{ yi{
"nnoremap y} yi}

"nnoremap c' ci'
"nnoremap c" ci"
"nnoremap c( ci(
"nnoremap c) ci)
"nnoremap c[ ci[
"nnoremap c] ci]
"nnoremap c{ ci{
"nnoremap c} ci}

"nnoremap d' di'
"nnoremap d" di"
"nnoremap d( di(
"nnoremap d) di)
"nnoremap d[ di[
"nnoremap d] di]
"nnoremap d{ di{
"nnoremap d} di}

vnoremap $ $h
noremap H ^
vnoremap L $h
nnoremap L $
nmap dL d$
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
    Plug 'mjbrownie/swapit'
call plug#end()

autocmd InsertLeave * :silent !D:/chrome下载/im-select.exe 1033
autocmd InsertEnter * :silent !D:/chrome下载/im-select.exe 2052
"----------easymotion configuration --------------------------------
let g:EasyMotion_smartcase=1
let g:EasyMotion_keys='asdfghjklqweruiop;zxcvnm'
let g:EasyMotion_do_mapping=0
let g:EasyMotion_grouping=2
let g:sneak#use_ic_scs = 1
map <Leader> <Plug>(easymotion-prefix)
map <Leader>s <Plug>(easymotion-s)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>l <Plug>(easymotion-lineforward)