syntax on

set background=dark

if (&ft=='ruby')
  colorscheme Tomorrow-Night
else
  " hydrid config
  "" https://gist.github.com/w0ng/3278077
  let g:hybrid_use_Xresources = 1
  colorscheme hybrid
endif


""""""""""""""""""""
" Old setting

" if has('gui_macvim')
"   " solarized
"   syntax enable
"   set background=dark
"   " set background=light
"   colorscheme solarized
" else
"   " Colour-Sampler-Pack
"   source ~/.vim/config/color.vim
"   colorscheme torte
" endif


" colorscheme torte
" "************************************************************************
" "*     カラースキームのテストスクリプト                                 *
" "*     使い方                                                           *
" "*     source % で読み込み　Shift+<F1> で次のカラースキームへ           *
" "*            Shift+<F2> で前のカラースキームへ             *
" "*                                                                      *
" "*      現在のテーマを確認するには↓                                    *
" "*                  :echo g:colors_name                                 *
" "************************************************************************
" " chdir C:\Program Files\Vim\vimfiles\colors\
" chdir ~/.vim/bundle/Colour-Sampler-Pack/colors
" "************************************************************************
"
" let g:colors_counter=-1
" let g:colors_list = split(expand("*"))
" let b:i=0
" while b:i < len(g:colors_list)-1
"   let idx=stridx(g:colors_list[b:i],".")
"   let name=g:colors_list[b:i][0:idx-1]
"   let g:colors_list[b:i]=name
"   let b:i += 1
" endwhile
"
" function! Colorscheme_next()
"   let g:colors_counter += 1
"   execute "colorscheme " . g:colors_list[g:colors_counter]
" endfunction
" " nmap <silent> <F5> :call Colorscheme_next()<CR>:echo g:colors_counter . " " . g:colors_list[g:colors_counter]<CR>
" nnoremap <silent> <Space>cn :call Colorscheme_next()<CR>:echo g:colors_counter . " " . g:colors_list[g:colors_counter]<CR>
"
" function! Colorscheme_back()
"   let g:colors_counter -= 1
"   execute "colorscheme " . g:colors_list[g:colors_counter]
" endfunction
" nnoremap <silent> <Space>cb :call Colorscheme_back()<CR>:echo g:colors_counter . " " . g:colors_list[g:colors_counter]<CR>
" " nnoremap <silent> <S-F2> :call Colorscheme_back()<CR>:echo g:colors_counter . " " . g:colors_list[g:colors_counter]<CR>
"
" ""
" "
" " aiseered
" " anotherdark.vim
" " aqua.vim
" " asu1dark.vim
" " bclear.vim
" " biogoo.vim
" " breeze.vim
" " candy.vim
" "
