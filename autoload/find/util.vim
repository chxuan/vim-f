" ==============================================================
" Author: chxuan <787280310@qq.com>
" Repository: https://github.com/chxuan/vim-f
" Create Date: 2018-07-21
" License: MIT
" ==============================================================

" 查找字符,返回所有下标
function! find#util#getchar(...)
    let mode = get(a:, 1, 0)
    while 1
        " Workaround for https://github.com/osyo-manga/vital-over/issues/53
        try
            let char = call("getchar", a:000)
        catch /^Vim:Interrupt$/
            let char = 3 " <C-c>
        endtry
        " Workaround for the <expr> mappings
        if string(char) !=# "\x80\xfd`"
            return mode == 1 ? !!char : type(char) == type(0) ? nr2char(char) : char
        endif
    endwhile
endfunction
