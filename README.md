# vim-searcher

Easily Search on google or DuckDuckGo from vim! Nothing else.

## Screenshot

![Screenshot](https://i.imgur.com/uFHSUM6.png)

## Install

* Install [googler](https://github.com/jarun/googler) or [ddgr](https://github.com/jarun/ddgr)
```bash
pip install googler
pip install ddgr
```

* Add `vim-searcher` using your plugin manager

```vim
" vim-plug
Plug 'meain/vim-searcher'
```

* By default it uses `googler`, if you wanna use ddgr
```
let g:vim_searcher_provider = 'ddgr'
```

## Commands

This plugin just provides one command `Searcher`.

**example**
```vim
:Searcher github
```

**or you could do some rempas like**
```vim
nnoremap <silent><leader>s :Searcher <c-r><c-w><cr>
vnoremap <silent><leader>s y:Searcher <c-r>"<cr>
```

#### Other recommended mappings

If you wanna replace a word or selection with a markdown style link to the top hit:
```
vnoremap <silent><leader>S c<C-R>=SearcherMarkdownAutoLinkGenerate(getreg('"'))<cr><esc>
nnoremap <silent><leader>S viwc<C-R>=SearcherMarkdownAutoLinkGenerate(getreg('"'))<cr><esc>
```

## Keymaps

Inside the searcher buffer, you can

* `c` - copy url to clipboard
* `m` - copy url in a markdown format - `[search_term](url)`
* `o` - open url in default browser
* `q` - quit

## TODO

* ~~Add syntax highlight for `__googler__` buffer~~
* ~~Clean up code~~
* More keymaps to show additional data ??

## Alternatives

- [christoomy/vim-quicklink](https://github.com/christoomey/vim-quicklink)
