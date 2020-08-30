call _deepl_init()

function! s:get_selected_text()
    let tmp = @@
    silent normal gvy
    let selected_text = @@
    let @@ = tmp
    return selected_text
endfunction

function! deepl#show_translated_text(source, target) range
    let selected_text = s:get_selected_text()
    echo _deepl_get_translated_text(a:source, a:target, selected_text)
endfunction

function! deepl#replace_to_translated_text(source, target) range
    let tmp = @@
    silent normal gvy
    let selected_text = @@
    let @@ = _deepl_get_translated_text(a:source, a:target, selected_text)
    silent normal gvp
    let @@ = tmp
endfunction
