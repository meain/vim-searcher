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

This plugin just provides one command `Google`. This shows the results from google in a buffer on top.

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

Inside the googler buffer, you can

* `c` - copy url to clipboard
* `m` - copy url in a markdown format - `[search_term](url)`
* `o` - open url in default browser
* `q` - quit

## TODO

* ~~Add syntax highlight for `__googler__` buffer~~
* More keymaps to show additional data
* Clean up code
