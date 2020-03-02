" vim-searcher - search from within vim using googler or ddgr
" Maintainer: Abin Simon


" Check if options are set
let g:vim_searcher_provider = get(g:, 'vim_searcher_provider', 'googler')


function! s:FormShellCommand(search_term)
    let l:comm = g:vim_searcher_provider." -n 10 ".a:search_term." --json"
    let l:comm = l:comm." | grep -E '^ *\"(url|title)' | cut -d':' -f2-"
    let l:comm = l:comm." | sed 's|^ *\"||;s|\"$||;s|\",||' | sed 'N;s|\\n|   |'"
    return l:comm
endfunction


function! Searcher(...)
    if a:0 == 0
        let l:search_term = expand('<cword>')
    else
        let l:search_term = a:1
    endif
    let g:vim_searcher_term = l:search_term " TODO: might have to make it a buffer local variable

    " create window
    topleft new __searcher__
    set ft=searcher
    setlocal buftype=nofile
    setlocal nowrap
    resize 10
    exec "0read !".s:FormShellCommand(l:search_term)
    redraw
    normal! gg
endfunction
command! -nargs=1 Searcher call Searcher(<f-args>)

function! SearchOpen()
    let search_openers = {
        \"linux": "xdg-open",
        \"darwin": "open",
        \}
    let url = matchstr(getline('.'), '\v(http|https|ftp).*$')
    echo  g:vim_searcher_term." ".url
    let os = system("uname | tr '[:upper:]' '[:lower:]' | tr -d '\n' | tr -d '\r' ")
    exec "!".search_openers[os]." '".url."'" | redraw
endfunction

function! SearchCopyUrl()
    let l:url = matchstr(getline('.'), '\v(http|https|ftp).*$')
    let @*=l:url
    echo "Copied ".l:url
endfunction

function! SearchMarkdownCopy()
    let l:url = matchstr(getline('.'), '\v(http|https|ftp).*$')
    let l:copier = "[".g:vim_searcher_term."](".l:url.")"
    let @*=l:copier
    echo "Copied ".l:copier
endfunction

augroup VimSearcher
    au!
    au FileType searcher nnoremap <buffer><silent> o :call SearchOpen() \| :bd!<cr>
    au FileType searcher nnoremap <buffer><silent> c :call SearchCopyUrl() \| :bd!<cr>
    au FileType searcher nnoremap <buffer><silent> m :call SearchMarkdownCopy() \| :bd!<cr>
    au FileType searcher nnoremap <buffer><silent> q :bd!<cr>
augroup end
