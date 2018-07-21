" ==============================================================
" Author: chxuan <787280310@qq.com>
" Repository: https://github.com/chxuan/vim-f
" Create Date: 2018-07-21
" License: MIT
" ==============================================================

" 高亮属性
highlight default VimF ctermfg=196 ctermbg=NONE cterm=bold guifg=red guibg=NONE gui=bold

" 查找字符
function! find#find#find_char()
    echo "Target key: "
    let target_key = edit#util#getchar()

    let pos = <sid>find_pos(target_key)
    call find#util#show_highlight(pos)
endfunction

" 查找字符位置
function! s:find_pos(char)
    let pos = []
    let lines = find#util#get_win_text()
    let row = find#util#get_win_first_row_num()

    for i in range(0, len(lines) - 1)
        let line = lines[i]
        for j in range(0, len(line) - 1)
            if line[j] ==# a:char
                call add(pos, (i + 1 + row - 1) . "-" . (j + 1))
            endif
        endfor
    endfor

    return pos
endfunction

"

