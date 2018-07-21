" ==============================================================
" Author: chxuan <787280310@qq.com>
" Repository: https://github.com/chxuan/vim-f
" Create Date: 2018-07-21
" License: MIT
" ==============================================================

if exists("g:vim_f_loaded")
    finish
endif

let g:vim_f_loaded = 1

nnoremap <expr> f find#find#find_char()

