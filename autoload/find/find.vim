" ==============================================================
" Author: chxuan <787280310@qq.com>
" Repository: https://github.com/chxuan/vim-f
" Create Date: 2018-07-21
" License: MIT
" ==============================================================

" 查找字符
function! find#find#find_char()
    echo "Target key: "
    let target_key = find#util#getchar()

    echo target_key
endfunction

