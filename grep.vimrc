" VIM Setup {{{

" END VIM SETUP }}}

" Plugins {{{

" grep
nnoremap <silent><Leader>a :Unite -silent -auto-preview -winheight=40 -no-quit
            \ grep<CR>
nnoremap <silent><Leader>A :UniteWithCursorWord -silent -auto-preview 
            \ -winheight=40 -no-quit grep<CR>

" END Plugins }}}

" Plugin Setup {{{
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -a -S'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-group --no-color'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
endif

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.grep = {
    \ 'description' : '           search files
        \                                          ⌘ [space]a',
    \}
let g:unite_source_menu_menus.grep.command_candidates = [
    \['▷ grep (ag → ack → grep)                                     ⌘ ,a',
        \'Unite -auto-preview -winheight=40 -no-quit grep'],
    \['▷ grep current word                                          ⌘ ,A',
        \'UniteWithCursorWord -auto-preview -winheight=40 -no-quit grep'],
    \['▷ find',
        \'Unite find'],
    \['▷ locate',
        \'Unite -start-insert locate'],
    \['▷ vimgrep (very slow)',
        \'Unite vimgrep'],
    \]
nnoremap <silent>[menu]a :Unite -silent menu:grep<CR>

" END Unite Menu }}}
