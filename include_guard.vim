function! InsertIncludeGuard()
       let l:filename = expand('%:t')

       let l:macro = '__' . toupper(substitute(l:filename, '\W\+', '_', 'g')) . '__'

      let l:save_cursor = getpos('.')

      silent! 1
    while getline('.') == ''
        silent! normal j
        if line('.') >= line('$')
            break
        endif
    endwhile

    put ='#ifndef ' . l:macro
    put ='#define ' . l:macro
    put ='/* Content of the header file */'
    put ='#endif'

    call setpos('.', l:save_cursor)
endfunction

nnoremap <F2> :call InsertIncludeGuard()<CR>

