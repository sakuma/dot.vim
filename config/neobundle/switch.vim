let g:switch_custom_definitions = [
      \   ["true", "false"],
      \ ]

autocmd FileType ruby let b:switch_costom_definitions = [
      \   ["unless", "if"],
      \   ["and", "or"],
      \   ["while", "until"],
      \   ["else", "elsif"],
      \   ["blank?", "present?"],
      \   ["describe", "context", "specific", "example"],
      \   ['before', 'after'],
      \   ['get', 'post', 'put', 'delete'],
      \   ['==', 'be_eql', 'equal'],
      \   ['.to_not', '.to'],
      \   { '([^. ]+).should(_not|)': 'expect(\1).to\2' },
      \   { 'expect(([^. ]+)).to(_not|)': '\1.should\2' },
      \ ]

" toggle word
nnoremap ! :Switch<cr>
