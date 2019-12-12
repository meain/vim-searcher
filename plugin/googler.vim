" vim-googler - Google search from within vim
" Maintainer: Abin Simon

" Do search
function! GoogleSearch(arg)
py3 << EOF
import vim
term = vim.eval("a:arg")
vim.command('topleft new __googler__')
vim.command('set ft=googler')
vim.command('setlocal buftype=nofile')
vim.command('setlocal nowrap')
vim.command('resize 10')
import json
import subprocess
search_term = term
# could even use ddgr
raw_search_result = subprocess.Popen(f'googler -n 10 {search_term} --json', shell=True, stdout=subprocess.PIPE).stdout.read()
search_results = json.loads(raw_search_result)
vim.command(f'let g:vim_googler_term="{search_term}"')
data = []
for el in search_results:
    title = el['title'][:59].ljust(60, ' ')  # fix utf-8 spacing issue
    data.append( f'{ title }   | { el["url"] }' )
vim.current.buffer[:] = data
EOF
endfunction
command! -nargs=1 Google call GoogleSearch(<f-args>)

" Open externally in a browser
function! GoogleSearchOpen()
py3 << EOF
import vim
import platform

openers = {'Linux': 'xdg-open', 'Windows': 'start', 'Darwin': 'open'}
current_line = vim.current.line
url = current_line.split('   | ')[1]
open_command = f'silent !{openers[platform.system()]} "{url}"'
vim.command(open_command)
EOF
endfunction

" Copy link to clipboard
function! GoogleSearchCopy()
py3 << EOF
import vim
current_line = vim.current.line
url = current_line.split('   | ')[1]
print (f'Copied {url}')
vim.command(f'let @*="{url}"')
vim.command(f'let @+="{url}"')
EOF
endfunction

" Copy markdown formatted link
" TODO: Change it to replacing the selection with markdown style link
function! GoogleSearchMarkdownCopy()
py3 << EOF
import vim

googler_term = vim.eval('g:vim_googler_term')
current_line = vim.current.line
url = current_line.split('   | ')[1]
url = '[' + googler_term + ']' + '(' + url + ')'
print (f'Copied {url}')
vim.command(f'let @*="{url}"')
vim.command(f'let @+="{url}"')
EOF
endfunction

augroup VimGoogler
    au!
    au FileType googler nnoremap <buffer><silent> o :call GoogleSearchOpen() \| :bd<cr>
    au FileType googler nnoremap <buffer><silent> c :call GoogleSearchCopy() \| :bd<cr>
    au FileType googler nnoremap <buffer><silent> m :call GoogleSearchMarkdownCopy() \| :bd \| :normal! gv"*p<cr>
    au FileType googler nnoremap <buffer><silent> q :bd<cr>
augroup end

nnoremap <silent><leader>s viwy:Google <c-r>"<cr>
vnoremap <silent><leader>s y:Google <c-r>"<cr>
