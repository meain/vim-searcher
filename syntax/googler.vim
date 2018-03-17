" syntax match GooglerTitle /^.\{-}\ze\[\#\#\]/
" syntax match GooglerUrl /[http|https|ftp].*$/
" syntax match GooglerSeperator /\[\#\#\]/ conceal
syntax match GooglerTitle /^.\{-}\ze\ \ \ |/
syntax match GooglerUrl /|\ .*$/
" syntax match GooglerSeperator /\[\#\#\]/ conceal

highlight default link GooglerTitle Title
highlight default link GooglerUrl Comment
" highlight GooglerSeperator
