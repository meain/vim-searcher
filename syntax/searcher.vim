syntax match SearcherTitle /^.\{-}\ze\ \ \ /
syntax match SearcherUrl /   [http|https|ftp].*$/

highlight default link SearcherTitle Title
highlight default link SearcherUrl Comment
