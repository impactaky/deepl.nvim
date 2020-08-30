
if exists('g:loaded_deepl_nvim')
    finish
endif
let g:loaded_deepl_nvim = 1

if !exists('g:deepl#api_key')
    if $DEEPL_API_KEY
        echomsg "Please set g:deepl#api_key or DEEPL_API_KEY environment variable"
        finish
    else
        let g:deepl#api_key = $DEEPL_API_KEY
    endif
endif

" command! -range DeeplShowTranslated :call deepl#show_translated_text('EN', 'JA')
" command! -range DeeplReplaceTranslated :call deepl#replace_to_translated_text('EN', 'JA')

