" Environment {

    " Basics {
    "
        set nocompatible                   " Use ViMproved, don't emulate old vi

     let $VIMHOME = $HOME . "/.vim"

    " }

    " Vundle {
        filetype off " Turned back on after loading bundles
        "set rtp+=~/.vim/bundle/vundle
        set rtp+=$VIMHOME/bundle/vundle
        call vundle#rc()
        Bundle 'gmarik/vundle'
    " }

" }

" Bundles {

    Bundle 'kien/ctrlp.vim'
    Bundle 'bling/vim-airline'
    Bundle 'L9', '1.1'
    Bundle 'FuzzyFinder', '4.2.2'
    Bundle 'terryma/vim-multiple-cursors'

    Bundle 'Lucius', '7.1.1'

    Bundle 'tpope/vim-fugitive'
    Bundle 'airblade/vim-gitgutter'
    Bundle 'godlygeek/tabular'
    Bundle 'mattn/emmet-vim'

    Bundle 'scrooloose/syntastic'

    " PHP syntax highlighting for 5.4, 5.5+
    Bundle 'StanAngeloff/php.vim'
    Bundle 'shawncplus/phpcomplete.vim'
    Bundle 'EvanDotPro/php_getset.vim'
    Bundle 'mikehaertl/pdv-standalone'

    Bundle 'saltstack/salt-vim'

    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'ervandew/supertab'
    Bundle 'thinca/vim-localrc'

    Bundle 'stephpy/vim-php-cs-fixer'

    Bundle 'majutsushi/tagbar'
    Bundle 'vim-php/tagbar-phpctags.vim'

    Bundle 'tpope/vim-vinegar'

    Bundle 'SirVer/ultisnips'
    Bundle 'honza/vim-snippets'

" }

" General {

    set autochdir
    filetype plugin indent on " Automatically detect file types.
    syntax on                 " syntax highlighting
   " set mouse=a               " automatically enable mouse usage
    set virtualedit=all       " allow for cursor beyond last character
    set history=1000          " Store a ton of history (default is 20)
    set hidden                " allow buffer switching without saving
    scriptencoding utf-8
    set encoding=utf-8
    " force *.md to filetyp markdown
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    " open markdown file with Chrome.
    autocmd BufEnter *.md exe 'noremap <f5> :!start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" %:p<CR>'
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
   " autocmd VimEnter * execute "cd" fnameescape(g:startDir)

" }

" Vim UI {
    let g:lucius_style='light'

    set shortmess+=I                       " Disable splash text
    set t_Co=256                           " Fix colors in the terminal

    if has("gui_gtk2")
      set guifont=Anonymous\ Pro\ for\ Powerline\ 11
    else
      set guifont=Anonymice_Powerline:h11:cANSI
    end
    silent color lucius                    " Vim colorscheme
    LuciusWhite
   "let g:Powerline_colorscheme = 'lucius' " Powerline colorscheme
    set laststatus=2                       " Always show status bar
    set mousemodel=popup                   " Enable context menu

    " Clean up the GUI in Gvim
    if has("gui_running")
        source $VIMRUNTIME/mswin.vim   " windows
        behave mswin
"        set guioptions-=T
"        set guioptions-=m
"        set guioptions+=LlRrb " bug?
"        set guioptions-=LlRrb
        set lines=43 columns=120
    endif

    set backspace=indent,eol,start " backspace for dummies
    set linespace=0                " no extra spaces between rows
    set number                     " line numbers on
    set cpoptions+=$               " cool trick to show what you're replacing
    set showmatch                  " show matching brackets/parenthesis
    set showcmd                    " show multi-key commands as you type
    set incsearch                  " find as you type search
    set hlsearch                   " highlight search terms
    set winminheight=0             " windows can be 0 line high
    set ignorecase                 " case insensitive search
    set smartcase                  " case sensitive when uc present
    set wildmenu                   " show list instead of just completing
    set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.
    "set scrolljump=5               " lines to scroll when cursor leaves screen
    set scrolloff=3                " minimum lines to keep above and below cursor
    set list                       " use the listchars settings
    set listchars=tab:»\           " show tabs
    set colorcolumn=101
    hi ColorColumn guibg=#F5F5F5

" }

" Formatting {

    "set nowrap        " wrap long lines
    set autoindent    " indent at the same level of the previous line
    set shiftwidth=4  " use indents of 4 spaces
    set expandtab     " tabs are spaces, not tabs
    set tabstop=4     " an indentation every four columns
    set softtabstop=4 " let backspace delete indent
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,phtml,vimrc autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" }

" command shortcuts {
    " Write and close the buffer
    :command! WQ w|bd
" }

" Key (re)Mappings {

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " Map F1 to Esc to prevent accidental opening of the help window
    map  <F1> <Esc>
    imap <F1> <Esc>

    " Easier moving in tabs and windows
    map <C-J> <C-W>j
    map <C-K> <C-W>k
    map <C-L> <C-W>l
    map <C-H> <C-W>h

    " Wrapped lines goes down/up to next row, rather than next line in file.
    "nnoremap j gj
    "nnoremap k gk

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " One less key-stroke for save
    nmap <silent> <leader>w :w<CR>

    " Easier copy/paste
    map <leader>v "+gP
    map <leader>c "+y

    " Save
    map <C-s> :w<cr>
    imap <C-s> <ESC>:w<cr>a

    " Ctrl-a for select all
    map <C-A> ggVG

    " Ctrl-b for fuzzy-buffer match
    map <C-B> :FufBuffer<CR>
    imap <C-B> <Esc>:FufBuffer<CR>
    :nnoremap <Tab> :bnext<CR>
    :nnoremap <S-Tab> :bprevious<CR>

    " Ctrl-p map prompt so you can put the directory in.
    map <C-p> :CtrlP 

    " delete line
    map <C-d> dd

    " Shift+Tab to
    imap <S-Tab> <C-d>

    " Toggle between absolute and relative line numbers
    "nnoremap <C-n>
    map <C-n> :set rnu! <CR>

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " ZenCoding-vim
    map <C-z> <C-y>,

    " pdv-standalone
    nnoremap <C-\>p :call PhpDocSingle()<CR>
    vnoremap <C-\>p :call PhpDocRange()<CR>

    map <leader>ctwms :silent !C:\~\.vim\bundle\phpcomplete.vim\bin\ctags.exe -f c:\~\git\LWHWMS\.ctags -R --fields=+aimS --languages=php C:\~\git\LWHWMS<CR>
" }

" Plugins {
    " ultisnip {
        map <leader>snipps :call UltiSnips#ListSnippets()<CR>
        "let g:UltiSnipsExpandTrigger="<tab>"
        "let g:UltiSnipsJumpForwardTrigger="<c-b>"
        "let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " }
    " netrw {
        let g:netrw_liststyle = 3
        let g:netrw_alto = 1
        let g:netrw_altv = 1
        let g:netrw_list_hide = ''
        let g:netrw_sort_options = "i"
        let g:netrw_mousemaps = 0
        nnoremap <C-e> :enew<CR> :Explore<CR>
    "}

    " pdv-standalone {
        " use "" as parameter to turn tag off
        let g:pdv_cfg_php4guess=0
        let g:pdv_cfg_Package=" "
        let g:pdv_cfg_Author="Chris Beck <cbeck@good-sam.com>"
        let g:pdv_cfg_Version="1.0"
        "let g:pdv_cfg_Copyright=""
        "let g:pdv_cfg_License=""
    " }

    " ctrlp {
        let g:ctrlp_show_hidden = 1
    " }

    " airline {
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#syntastic#enabled = 1
        let g:airline#extensions#whitespace#enabled = 0
    " }
    " syntastic {
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_php_checkers = ['php']
        let g:syntastic_php_phpcs_exe="C:\\users\\cbeck\\php-qa\\phpcs.bat"
        let g:syntastic_php_phpcs_args="--standard=c:\\~\\php-qa\\phpcs.xml"
        " This is not working yet
        "let g:syntastic_php_phpmd_exe="C:\\users\\cbeck\\php-qa\\phpmd.bat"
        "let g:syntastic_php_phpmd_post_args="xml c:\\~\\php-qa\phpmd.xml"
    " }

    " supertab {
     "   if has("gui_running")
     " This is not working :(
            let g:SuperTabMappingForward = '<C-Space>'
            let g:SuperTabMappingBackward = '<S-C-Space>'
     "   else
    "        let g:SuperTabMappingForward = '<nul>'
    "        let g:SuperTabMappingBackward = '<s-nul>'
    "    endif
    " }

    " php-cs-fixer {
        let g:php_cs_fixer_fixers_list = "indentation,linefeed,trailing_spaces,unused_use,phpdoc_params,short_tag,return,visibility,php_closing_tag,braces,extra_empty_lines,function_declaration,include,controls_spaces,elseif,eof_ending"
        let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
        let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
        let g:php_cs_fixer_verbose = 1
    " }

    " phpcomplete {
        let g:phpcomplete_parse_docblock_comments = 1
        autocmd FileType php set omnifunc=phpcomplete#CompletePHP
        set completeopt=longest,menuone
    " }

    " tagbar {
        let g:tagbar_ctags_bin = "C:\\~\\.vim\\bundle\\phpcomplete.vim\\bin\\ctags.exe"
        nmap <F8> :TagbarToggle<CR>
    "}

    " phpctags {
        let g:tagbar_phpctags_bin='C:\\~\\php-qa\\phpctags.bat'
    " }

" }

" Functions {

    " Source: http://vim.wikia.com/wiki/VimTip165
    " Cleanly deletes a buffer without messing up the window layout.
    " Modified by Evan to prompt for unsaved changes.
    function! s:Kwbd(kwbdStage)
      if(a:kwbdStage == 1)
        if(!buflisted(winbufnr(0)))
          bd!
          return
        endif
        let s:kwbdBufNum = bufnr("%")
        let s:kwbdWinNum = winnr()
        windo call s:Kwbd(2)
        execute s:kwbdWinNum . 'wincmd w'
        let s:buflistedLeft = 0
        let s:bufFinalJump = 0
        let l:nBufs = bufnr("$")
        let l:i = 1
        while(l:i <= l:nBufs)
          if(l:i != s:kwbdBufNum)
            if(buflisted(l:i))
              let s:buflistedLeft = s:buflistedLeft + 1
            else
              if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
                let s:bufFinalJump = l:i
              endif
            endif
          endif
          let l:i = l:i + 1
        endwhile
        if(!s:buflistedLeft)
          if(s:bufFinalJump)
            windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
          else
            enew
            let l:newBuf = bufnr("%")
            windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
          endif
          execute s:kwbdWinNum . 'wincmd w'
        endif
        if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
          execute ":confirm :bd " . s:kwbdBufNum
        endif
        if(!s:buflistedLeft)
          set buflisted
          set bufhidden=delete
          set buftype=
          setlocal noswapfile
        endif
      else
        if(bufnr("%") == s:kwbdBufNum)
          let prevbufvar = bufnr("#")
          if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
            b #
          else
            bn
          endif
        endif
      endif
    endfunction

    command! Kwbd call s:Kwbd(1)
    nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>
    nmap <silent> <leader>q :Kwbd<CR>

    " Put all swap, backup, and view files in a central location
    " Source: spf-13-vim (https://github.com/spf13/spf13-vim/blob/4f01f8f7a35736fc106a1735e076a83ac548e104/.vimrc#L552)
    " Modified by Evan to better handle swap file paths for editing multiple
    " files with the same filename.
    function! InitializeDirectories()
         let parent = $VIMHOME
        let prefix = '.'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = parent . '/' . prefix . dirname . '/'
            if exists('*mkdir')
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo 'Warning: Unable to create backup directory: ' . directory
                echo 'Try: mkdir -p ' . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", 'g')
                " add trailing slashes to name swap files with full path
                exec 'set ' . settingname . '^=' . directory . '//'
            endif
        endfor
    endfunction
    call InitializeDirectories()

    " Highlight trailing whitespace in red
    " Source: http://vim.wikia.com/wiki/Highlight_unwanted_spaces
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

" }
