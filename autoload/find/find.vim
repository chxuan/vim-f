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
    let size = len(pos)
    if size == 1
        " call <sid>check_edit_type("a")
    elseif size > 1
        call find#util#show_highlight(pos)
        call timer_start(0, 'SelectHighlightChar', {'repeat': 1})
    else
        echo "Not found target key: " . target_key
    endif
endfunction

" 选择高亮字符
function! SelectHighlightChar(id)
    call timer_stop(a:id)
    let char1 = edit#util#getchar()
    let char2 = edit#util#getchar()
    " call <sid>check_edit_type(char)
    call edit#util#clean_highlight()
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
