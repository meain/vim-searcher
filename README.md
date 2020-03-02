# vim-googler

Easily Google from vim! Nothing else.

## Screenshot
![Screenshot](https://i.imgur.com/tgooB0Z.png)
<details>
<summary> GIF - a bit outdated </summary>
<br>
![GIF](https://i.imgur.com/dL7z2PJ.gif)
</details>

## Install

* Install `googler` or `ddgr`
```bash
pip install googler
pip install ddgr
```

* Add `vim-googler` using your plugin manager

```vim
" vim-plug
Plug 'meain/vim-googler'
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
nnoremap <silent><leader>s :Google <c-r><c-w><cr>
vnoremap <silent><leader>s y:Google <c-r>"<cr>
```

## Keymaps

Inside the googler buffer, you can

* `c` - copy url to clipboard
* `m` - copy url in a markdown format - `[search_term](url)`
* `o` - open url in default browser
* `q` - quit

## TODO

* ~~Add syntax highlight for `__googler__` buffer~~
* ~Clean up code~
* More keymaps to show additional data ??
