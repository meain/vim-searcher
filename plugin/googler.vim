" Google search from within vim
function! GoogleSearch(arg)
py3 << EOF
import vim
term = vim.eval("a:arg")
vim.command('topleft new __googler__')
vim.command('set ft=googler')
vim.command('setlocal buftype=nofile')
import json
import subprocess
search_term = term
raw_search_result = subprocess.Popen(f'googler -n 10 -c us -l en {search_term} --json', shell=True, stdout=subprocess.PIPE).stdout.read()
search_results = json.loads(raw_search_result)
data = []
for el in search_results:
    title = el['title'][:59].ljust(60, ' ')
    data.append( f'{ title } [##] { el["url"] }' )
vim.current.buffer[:] = data
EOF
endfunction
command! -nargs=1 Google call GoogleSearch(<f-args>)
function! GoogleSearchOpen()
py3 << EOF
import vim
current_line = vim.current.line
url = current_line.split('[##] ')[1]
vim.command(f'silent !open {url}')
EOF
endfunction
au FileType googler nnoremap <buffer><silent> o :call GoogleSearchOpen()<cr>
function! GoogleSearchCopy()
py3 << EOF
import vim
current_line = vim.current.line
url = current_line.split('[##] ')[1]
print (f'Copied {url}')
vim.command(f'silent !echo {url} | pbcopy')
EOF
endfunction
au FileType googler nnoremap <buffer><silent> c :call GoogleSearchCopy()<cr>
au FileType googler nnoremap <buffer><silent> q :bd<cr>
