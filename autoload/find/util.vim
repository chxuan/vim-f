" ==============================================================
" Author: chxuan <787280310@qq.com>
" Repository: https://github.com/chxuan/vim-f
" Create Date: 2018-07-21
" License: MIT
" ==============================================================

" 获得当前行号
function! find#util#get_current_row_num()
    return line(".")
endfunction

" 获得总行数
function! find#util#get_total_row_num()
    return line("$")
endfunction

" 获得窗口起始行
function! find#util#get_win_first_row_num()
    return line(".") - winline() + 1
endfunction

" 获得窗口高度
function! find#util#get_win_height()
    return winheight(winnr('$'))
endfunction

" 获得窗口文本
function! find#util#get_win_text()
    let begin = find#util#get_win_first_row_num()
    let row = begin + find#util#get_win_height() - 1
    let total = find#util#get_total_row_num()
    let end = row < total ? row : total

    return getline(begin, end)
endfunction

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

" 显示语法高亮
function! find#util#show_highlight(pos, chars)
    execute 'highlight! link Conceal' 'VimF'

    setlocal conceallevel=2
    setlocal concealcursor=ncv

    for i in range(0, len(a:pos) - 1)
        let ret = split(a:pos[i], "-")
        call matchaddpos('Conceal', [[ret[0], ret[1]]], 10, -1, {'conceal': a:chars[i][0]})
        call matchaddpos('Conceal', [[ret[0], ret[1] + 1]], 10, -1, {'conceal': a:chars[i][1]})
    endfor
endfunction

" 清除语法高亮
function! find#util#clean_highlight()
    call clearmatches()
endfunction

