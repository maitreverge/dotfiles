" Insert include guard in a C header file
function! InsertIncludeGuard()
    " Get the current filename
    let l:filename = expand('%:t')

    " Generate the include guard macro name
    let l:macro = '__' . toupper(substitute(l:filename, '\W\+', '_', 'g')) . '__'

    " Save the current cursor position
    let l:save_cursor = getpos('.')

    " Move to the first non-empty line
    silent! 1
    while getline('.') == ''
        silent! normal j
        if line('.') >= line('$')
            break
        endif
    endwhile

    " Insert the include guard directives
    put ='#ifndef ' . l:macro
    put ='#define ' . l:macro
    put ='/* Content of the header file */'
    put ='#endif'

    " Restore the cursor position
    call setpos('.', l:save_cursor)
endfunction

" Map a key combination to trigger the insertion of include guard
nnoremap <F2> :call InsertIncludeGuard()<CR>

