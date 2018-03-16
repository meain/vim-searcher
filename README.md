# vim-googler

Easily Google from vim! Nothing else.

## Install

* Install `googler`
```bash
pip install googler
```

* Add `vim-googler` using your plugin manager

```vim
" vim-plug
Plug 'meain/vim-googler'
```

## Commands

This plugin just provides one command `Google`.

**example**
```vim
:Google github
```

**or you could do some rempas like**
```vim
nnoremap <silent><leader>s :Google <c-r><c-w><cr>
vnoremap <silent><leader>s y:Google <c-r>"<cr>
```

## Keymaps

* `c` - copy url to clipboard
* `o` - open url in default browser
* `q` - quit

