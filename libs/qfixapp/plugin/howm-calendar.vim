"=============================================================================
"    Description: howm calendar
"                 datelib.vim requiard
"         Author: fuenor <fuenor@gmail.com>
"                 http://sites.google.com/site/fudist/Home/qfixhowm
"        Version: 2.00
"=============================================================================
scriptencoding utf-8
if v:version < 700 || &cp
  finish
endif
" calendar.vimで使う休日定義ファイル
" https://sites.google.com/site/fudist/Home/qfixhowm#downloads
if !exists('g:calendar_holidayfile')
  " let g:calendar_holidayfile = '~/qfixmemo/Sche-Hd-0000-00-00-000000.howm'
  let g:calendar_holidayfile = ''
endif
" CalHolidayのハイライト指定
if !exists('g:calendar_CalHoliday')
  " let g:calendar_CalHoliday = 'CalMemo'
  let g:calendar_CalHoliday = 'CalSunday'
endif
" サインの表示位置 left-fit, left, right
if !exists("g:calendar_mark") || (g:calendar_mark != 'left' && g:calendar_mark != 'left-fit' && g:calendar_mark != 'right')
  let g:calendar_mark = 'left-fit'
endif

if !exists('g:calendar_flag')
  let g:calendar_flag=['', '+', '@', '#']
endif

if !exists('g:calendar_action')
  let g:calendar_action = "<SID>CalendarDiary"
endif
if !exists('g:calendar_sign') || g:calendar_sign == '<SID>CalendarSign'
  let g:calendar_sign = "CalendarSign_"
endif
if !exists('g:calendar_info')
  let g:calendar_info = "<SID>CalendarInfo"
endif

" 独自ハイライトへの変更
function! CalendarPost()
  if g:calendar_howm_syntax == 0
    return
  endif
  let ch = g:calendar_flag[2] . '_'
  exe 'syn match CalConceal /['.ch.']/ contained'
  let ch = g:calendar_flag[2] . g:calendar_flag[3]
  if g:calendar_mark =~ 'left-fit'
    exe 'syn match CalHoliday display "\s*['.ch.']\d*" contains=CalConceal'
  elseif g:calendar_mark =~ 'right'
    exe 'syn match CalHoliday display "\d*['.ch.']\s*" contains=CalConceal'
  else
    exe 'syn match CalHoliday display "['.ch.']\s*\d*" contains=CalConceal'
  endif
  " 今日が休日
  if DatelibHolidayCheck(strftime('%Y'), strftime('%m'), strftime('%d'), 'Sun')
    hi link CalToday CalHoliday
  endif
  hi link CalMemo    PreProc
  hi link CalSunday  WarningMsg
  exe 'hi def link CalHoliday '.g:calendar_CalHoliday
  hi def link CalConceal Ignore
endfunction

function! s:CalendarPost(win)
  augroup Calendar
    au!
    if a:win
      exe 'au BufEnter __Calendar resize '.winheight(0)
    else
      exe 'au BufEnter __Calendar vertical resize '.winwidth(0)
    endif
  augroup END
endfunction

if !exists('*QFixMemoCalendarSign')
" カレンダーのサインを返す
" @ # は休日としてハイライトされる
function! QFixMemoCalendarSign(day, month, year)
  " holiday : 日曜以外の休日かどうか
  let holiday = DatelibHolidayCheck(a:year, a:month, a:day, 'Sun')
  " file    : 日記ファイル名(フルパス)
  let file = QFixMemoCalendarFile(a:year, a:month, a:day)
  let id = filereadable(expand(file)) + holiday*2
  return g:calendar_flag[id]
endfunction
endif

if !exists('*QFixMemoCalendarFile')
" 日記ファイル名をフルパスで返す
function! QFixMemoCalendarFile(year, month, day)
  let year  = printf("%4.4d",a:year)
  let month = printf("%2.2d",a:month)
  let day   = printf("%2.2d",a:day)
  let file = ''
  if exists('g:qfixmemo_diary') && exists('g:qfixmemo_dir')
    let file = g:qfixmemo_diary
    let ext = tolower(fnamemodify(file, ':e'))
    let ext = exists('g:qfixmemo_ext') ? g:qfixmemo_ext : ext
    if tolower(fnamemodify(file, ':e')) != g:qfixmemo_ext
      let file .= '.' . g:qfixmemo_ext
    endif
    let file = substitute(file, '%Y', year, 'g')
    let file = substitute(file, '%m', month, 'g')
    let file = substitute(file, '%d', day, 'g')
    let file = g:qfixmemo_dir.'/'.file
  endif
  return file
endfunction
endif

if !exists('*QFixMemoCalendarDiary')
" カレンダーの日付上で<CR>を押した場合に呼び出される
" CAUTION: weekは calendar_vimとの整合性を保つためのもので使用不可
" dir には現在のqfixmemo_dir(howm_dir)がコピーされている
function! QFixMemoCalendarDiary(day, month, year, week, dir)
  let year  = printf("%4.4d", a:year)
  let month = printf("%2.2d", a:month)
  let day   = printf("%2.2d", a:day)
  let file = g:qfixmemo_diary
  let file = substitute(file, '%Y', year, 'g')
  let file = substitute(file, '%m', month, 'g')
  let file = substitute(file, '%d', day, 'g')
  call qfixmemo#Edit(file)
endfunction
endif

"=============================================================================
if !exists("g:calendar_diary")
  let g:calendar_diary = "~/diary"
endif

function! s:CalendarDiary(day, month, year, week, dir)
  call confirm("diary plugin requiard.", 'OK')
endfunction

function! CalendarSign_(day, month, year)
  let sfile = g:calendar_diary."/".a:year."/".a:month."/".a:day.".cal"
  let hday = DatelibHolidayCheck(a:year, a:month, a:day, 'Sun')
  let id = filereadable(expand(sfile)) + hday*2
  return g:calendar_flag[id]
endfunction

" カレンダーコマンドをオーバーライド
if !exists('g:howm_calendar')
  let g:howm_calendar = 0
endif
" calendar.vimのコマンドをqfixmemo-calendar.vimのハイライト表示に変更
if !exists('g:calendar_howm_syntax')
  let g:calendar_howm_syntax = 1
endif

au VimEnter * call <SID>VimEnter()
function! s:VimEnter()
  if !exists(':Calendar') || g:howm_calendar
    command! -nargs=* Calendar  call HowmCalendar(0,<f-args>)
    command! -nargs=* CalendarH call HowmCalendar(1,<f-args>)
  elseif g:calendar_howm_syntax
    command! -nargs=* Calendar  call Calendar(0,<f-args>) | call CalendarPost()
    command! -nargs=* CalendarH call Calendar(1,<f-args>) | call CalendarPost()
  endif
endfunction

"=============================================================================
"    Description: QFixMemo Calendar
"         Author: fuenor <fuenor@gmail.com>
"                 http://sites.google.com/site/fudist/Home/qfixhowm
"=============================================================================
let s:version = 1.04
scriptencoding utf-8
if v:version < 700 || &cp
  finish
endif

if exists('g:QFixMemoCalendar_version') && g:QFixMemoCalendar_version < s:version
  let g:loaded_QFixMemoCalendar_vim = 0
endif
if exists("g:loaded_QFixMemoCalendar_vim") && g:loaded_QFixMemoCalendar_vim && !exists('fudist')
  finish
endif
let g:QFixMemoCalendar_version = s:version
let g:loaded_QFixMemoCalendar_vim = 1

" 曜日表示
" 0 : 英語
" 1 : 日本語
" 2 : 日本語+陰暦
if !exists('g:calendar_jp')
  let g:calendar_jp = 2 * ($LANG =~ 'ja')
endif
" カレンダーボード
if !exists('g:calendar_footer')
  let g:calendar_footer = [
    \ '  {num}<CR> : Diary',
    \ '  -----------------',
    \ '  <S-Left>|<S-Right>',
    \ '  -----------------',
    \ '   i  o : Prev/Next',
    \ '   <  > : Prev/Next',
    \ '    .   : Command',
    \ '    t   : Today',
    \ '    q   : Close',
    \ '    r   : Reload',
    \]
endif

" サブメニューにカレンダー表示
if !exists('g:submenu_calendar_syntax')
  let g:submenu_calendar_syntax = 'howm_calendar'
endif
if !exists('g:submenu_calendar_lmargin')
  let g:submenu_calendar_lmargin = ''
endif
if !exists('g:submenu_calendar_winfixheight')
  let g:submenu_calendar_winfixheight = 1
endif
if !exists('g:submenu_calendar_winfixwidth')
  let g:submenu_calendar_winfixwidth = 1
endif
if !exists('g:qfixtempname')
  let g:qfixtempname = tempname()
endif
function! QFixMemoCalendar(dircmd, file, cnt, ...)
  let file = fnamemodify(g:qfixtempname, ':p:h') .'/'. a:file
  let winnr = bufwinnr(file)
  if winnr != -1
    exe winnr.'wincmd w'
    return
  endif
  let init = 0
  let windir = a:dircmd
  let win = windir =~ 'vert'
  let winsize = 0 "winwidth(0)
  let parent = 0
  if a:0 && a:1 =~ 'parent'
    let parent = 1
    let winsize = winwidth(0)
  endif
  let l:calendar_width = 3*7+strlen(g:submenu_calendar_lmargin)+1
  let l:calendar_width += g:calendar_mark =~ 'right'
  if parent == 0
    let winsize = l:calendar_width
  else
    let l:calendar_width = winwidth(0)
    let winsize = winwidth(0)
  endif
  let pbufnr = parent ? bufnr('%') : 0
  let b:calendar_pbuf = parent ? bufnr('%') : 0
  let saved_ei = &eventignore
  set eventignore=BufEnter,BufLeave
  exe 'silent! ' . windir . ' ' . (winsize == 0 ? '' : string(winsize)) . 'split '.escape(file, ' ')
  let &eventignore = saved_ei
  if !exists('b:calendar_width')
    let b:calendar_width = winsize
    let b:submenu_calendar_lmargin = g:submenu_calendar_lmargin
    let init = 1
  endif
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal nobuflisted
  setlocal noswapfile
  setlocal nolist
  setlocal nowrap
  setlocal nonumber
  setlocal nomodifiable
  let &winfixheight = g:submenu_calendar_winfixheight
  let &winfixwidth  = g:submenu_calendar_winfixwidth
  setlocal foldcolumn=0
  let cbufnr = bufnr('%')
  if exists('g:QFix_PreviewUpdatetime')
    let b:qfixwin_updatetime = 1
    exe 'setlocal updatetime='.g:QFix_PreviewUpdatetime
  endif
  if a:0 && a:1 =~ 'parent'
    let calid = 1
    augroup CalMsgP
      au!
      exe 'au CursorHold '.a:file.' call <SID>Msg(1)'
    augroup END
    setlocal statusline=\ %{g:calendar_statusline1}
  else
    let calid = 0
    augroup CalMsg
      au!
      exe 'au CursorHold '.a:file.' call <SID>Msg(0)'
    augroup END
    setlocal statusline=\ %{g:calendar_statusline0}
  endif
  let b:calendar_dircmd = windir
  call s:build(a:cnt)
  let winheight = line('$')
  let b:calendar_winfixheight = a:0
  let b:calendar_resize = 0
  if parent
    let b:calendar_resize = parent + (a:1 =~ 'resize' ? 1 :0)
    call s:winfixheight(winheight)
    " サブメニューと同時にウィンドウクローズするためのフック
    exe 'augroup SubmenuCalendar'.cbufnr
      au!
      exe 'au BufWinLeave * call <SID>SCBufWinLeave('.pbufnr.','.cbufnr.')'
    augroup END
  elseif win
    let b:calendar_resize = 1
  else
    let b:calendar_resize = 1
    exe 'resize '.b:calendar_height
    call s:winfixheight(winheight)
  endif
  " オートリサイズ
  exe 'augroup SubmenuCalendar'.cbufnr
    exe 'au BufEnter    * call <SID>SCBufEnter('.pbufnr.','.cbufnr.')'
  augroup END
  if init
    call search('\.')
    call search('\*')
  endif
  call <SID>syntax()
  call CalendarPost()
  if a:0 && a:1 =~ 'parent'
    call search('\*')
  endif
  call <SID>Msg(calid)

  nnoremap <silent> <buffer> q    :close<CR>
  nnoremap <silent> <buffer> >    :<C-u>call <SID>CR('>.')<CR>
  nnoremap <silent> <buffer> <    :<C-u>call <SID>CR('<.')<CR>
  nnoremap <silent> <buffer> i    :<C-u>call <SID>CR('<.')<CR>
  nnoremap <silent> <buffer> I    :<C-u>call <SID>CR('>.')<CR>
  nnoremap <silent> <buffer> o    :<C-u>call <SID>CR('>.')<CR>
  nnoremap <silent> <buffer> O    :<C-u>call <SID>CR('<.')<CR>
  nnoremap <silent> <buffer> r    :<C-u>call <SID>CR('r')<CR>
  nnoremap <silent> <buffer> t    :<C-u>call <SID>CR('today')<CR>
  nnoremap <silent> <buffer> .    :<C-u>call <SID>CR('.')<CR>
  nnoremap <silent> <buffer> <CR> :<C-u>call <SID>CR()<CR>
  " nnoremap <silent> <buffer> <Up>    :<C-u>call <SID>CR('up')<CR>
  " nnoremap <silent> <buffer> <Down>  :<C-u>call <SID>CR('down')<CR>
  nnoremap <silent> <buffer> <S-Up>    :<C-u>call <SID>CR('<<.')<CR>
  nnoremap <silent> <buffer> <S-Down>  :<C-u>call <SID>CR('>>.')<CR>
  nnoremap <silent> <buffer> <S-Right> :<C-u>call <SID>CR('>.')<CR>
  nnoremap <silent> <buffer> <S-Left>  :<C-u>call <SID>CR('<.')<CR>
  nnoremap <silent> <buffer> w  :<C-u> call <SID>calmovecmd('')<CR>
  nnoremap <silent> <buffer> b  :<C-u> call <SID>calmovecmd('b')<CR>
  let save_cursor = getpos('.')
  call cursor(1, 1)
  exe 'normal! z-'
  call setpos('.', save_cursor)
  if a:0
    silent! wincmd p
  endif
endfunction

function! s:CR(...)
  if count == 0
    let key = expand('<cWORD>')
    if key !~ '[<>./]\|\(^[A-Z][a-z]\{2}$\)'
      let key = expand('<cword>')
    endif
    let key =  a:0 ? a:1 :key
  elseif count < 32
    let key = count
  else
    echo 'QFixCalendar : invalid argument.'
    return
  endif
  let save_cursor = getpos('.')
  let [lnum, col] = searchpos('\d\{4}/\d\{2}', 'ncbW')
  let lnum = lnum == 0 ? 1 : lnum
  let str = strpart(getline('.'), 0, col('.'))
  let cnt = strlen(substitute(str, '[^|]', '', 'g'))
  let str = substitute(getline(lnum), '\(.\{-}|\)\{'.cnt.'}', '', '')
  let year  = matchstr(str, '\d\{4}')
  let month = matchstr(str, '/\zs\d\{2}')

  if key =~ '<\+\|>\+'
    let b:calendar_month += (key =~ '>' ? 1 : -1) * (key =~ '<<\|>>' ? 12 : 1)
    call s:build()
    if key =~ '\.'
    elseif b:calendar_dircmd =~ 'vert'
      " call s:winfixheight(b:calendar_height)
      let pl = line('.') - search(key, 'cnb')
      let nl = line('.') - search(key, 'cn')
      if abs(pl) <= abs(nl)
        call search(key, 'cb')
      else
        call search(key, 'c')
      endif
    else
      call search('\d\{4}/\d\{2}', 'cW')
      call search(key, 'cb')
    endif
  elseif key =~ '^\d\+$'
    " 特殊バッファしかない
    if exists('*QFixWinnr') && QFixWinnr() == -1
      let vert = b:calendar_dircmd =~ 'vert'
      let hjkl = b:calendar_dircmd =~ '\(^\|\s*\)\(rightb\|bel\|bo\)'
      if vert
        exe (hjkl ? 'leftabove vsplit' : 'rightbelow vsplit ')
        bprev
      else
        exe (hjkl ? 'leftabove split' : 'rightbelow split')
        bprev
      endif
    endif
    let week = line('.') - lnum - 1
    let dir = exists('g:qfixmemo_dir') ? g:qfixmemo_dir : g:calendar_diary
    exe 'call '.g:calendar_action.'(key, month, year, week, dir)'
  elseif key =~ 'up\|down'
    let b:calendar_month += key =~ 'up' ? -1 : 1
    call s:build()
    call s:winfixheight(b:calendar_height)
    call search('\.', 'c')
  elseif a:0 && a:1 == '.'
    call search(printf('%4.4d/%2.2d', year, month), 'cb')
    call search('\.', 'cb')
  elseif key =~ '\ctoday'
    let b:calendar_year  = strftime('%Y')
    let b:calendar_month = strftime('%m')
    let b:calendar_day   = strftime('%d')
    call s:build()
    call s:winfixheight(b:calendar_height)
    call cursor(1, 1)
    call search('\('.b:calendar_day.'\)\?\*\s*\('.b:calendar_day.'\)\?', 'c')
  elseif key =~ 'r'
    let save_cursor = getpos('.')
    call s:build()
    call s:winfixheight(b:calendar_height)
    call setpos('.', save_cursor)
  elseif expand('<cWORD>') =~ '\d\{4}/\d\{2}' || key == '.'
    call inputsave()
    let ystr = substitute(input("YYYY/MM : "), '[^0-9.t]', '', 'g')
    call inputrestore()
    redraw | echo ''
    if ystr == ''
      return
    endif
    if ystr =~ '^[.t]$'
      let b:calendar_year  = strftime('%Y')
      let b:calendar_month = strftime('%m')
    elseif strlen(ystr) >= 4
      let b:calendar_year  = str2nr(strpart(ystr, 0, 4))
      let b:calendar_month = str2nr(strpart(ystr, 4))
    else
      let b:calendar_month = str2nr(strpart(ystr, 0, 2))
    endif
    if b:calendar_month < 1 || b:calendar_month > 12
      let b:calendar_month = 1
    endif
    let b:calendar_day = 1
    call s:build()
    call s:winfixheight(b:calendar_height)
    call cursor(1, 1)
    call search(b:calendar_year.'/'.b:calendar_month)
    call search('\.', 'cb')
    return
  endif
endfunction

function! s:calmovecmd(cmd)
  let c = count > 0 ? count : 1
  for n in range(c)
    call search('\([*] \?\)\?[0-9<.>]\+[*]\?', a:cmd)
    while expand('<cWORD>') =~ '\d\{4}/\d\{2}' " && expand('<cword>') =~ '^\d\{2}$'
      call search('\([*] \?\)\?[0-9<.>]\+[*]\?', a:cmd)
    endwhile
  endfor
endfunction

function! s:build(...)
  let save_cursor = getpos('.')
  let num = exists('b:calendar_count') ? b:calendar_count : 3
  let num = a:0 ? a:1 : num
  let b:calendar_count = num
  let dir = b:calendar_dircmd !~ 'vertical'
  let b:calendar_dir   = dir
  let row = dir ? 1 : num
  let col = dir ? num : 1
  setlocal modifiable
  let glist = s:CalendarStr(row, col)
  if row > 1 && col == 1
    call extend(glist, g:calendar_footer)
  elseif row == 1 && col > 1
    " for idx in range(len(glist))
    "   let glist[idx] .= g:calendar_footer[idx]
    " endfor
  endif
  let b:calendar_height = len(glist)
  silent! %delete _
  call setline(1, glist)
  if num > 1
    call cursor(1, 1)
    exe 'normal! z-'
    call setpos('.', save_cursor)
  endif
  setlocal nomodifiable
endfunction

let g:calendar_statusline0 = ''
let g:calendar_statusline1 = ''
function! s:Msg(id)
  let str = strpart(getline('.'), 0, col('.'))
  let cnt = strlen(substitute(str, '[^|]', '', 'g'))
  let msg = CalendarInfo()
  exe "let g:calendar_statusline".a:id." = len(msg) == 0 ? '' : msg[0]"
  call map(msg, "substitute(v:val, '^', '_', '')")

  let save_cursor = getpos('.')
  setlocal modifiable
  let lnum = search('^\s*_', 'ncW')
  let padding = '_'.repeat(' ', 21+(g:calendar_mark =~ 'right'))
  silent! exe '%s/^_.*/'.padding.'/g'
  if lnum && len(msg) > 0
    let padding = repeat('_', (21+2+(g:calendar_mark =~ 'right'))*cnt)
    call setline(lnum, padding.msg[0])
  endif
  setlocal nomodifiable
  call setpos('.', save_cursor)
endfunction

function! CalendarInfo()
  if getline('.') =~ '< \. >'
    if expand('<cWORD>') =~ '\d\{4}/\d\{2}'
      return [' YYYY/MM (t:today)']
    elseif expand('<cWORD>') == '<'
      return [' Prev Month (< i)']
    elseif expand('<cWORD>') == '.'
      return [' YYYY/MM (t:today)']
    elseif expand('<cWORD>') == '>'
      return [' Next Month (> o)']
    endif
    return []
  endif
  let save_cursor = getpos('.')
  let [lnum, col] = searchpos('\d\{4}/\d\{2}', 'ncbW')
  let lnum = lnum == 0 ? 1 : lnum
  let str = strpart(getline('.'), 0, col('.'))
  let cnt = strlen(substitute(str, '[^|]', '', 'g'))
  let str = substitute(getline(lnum), '\(.\{-}|\)\{'.cnt.'}', '', '')
  let year  = matchstr(str, '\d\{4}')
  let month = matchstr(str, '/\zs\d\{2}')
  let day = expand('<cword>')

  exe 'let info = '.g:calendar_info.'(day, month, year)'
  if info != []
    return info
  endif

  let tbl = DatelibGetHolidayTable(year)
  let date = printf('%4.4d%2.2d%2.2d', year, month, day)
  if exists('tbl[date]') && tbl[date] != ''
    return [tbl[date]]
  endif
  return []
endfunction

function! s:CalendarInfo(day, month, year)
  let day   = a:day
  let month = a:month
  let year  = a:year

  if day == 24 && month == 12
    return [' Merry Xmas!']
  elseif day == 31 && month == 10
    return [' Trick or Treat?']
  elseif day == 1 && month == 1
    return [' Happy New Year!']
  endif

  let file = expand(QFixMemoCalendarFile(year, month, day))
  if filereadable(file)
    let info = readfile(file, '', 1)
    if exists('g:qfixmemo_fileencoding')
      call map(info, "iconv(v:val, g:qfixmemo_fileencoding, &enc)")
    endif
    return info
  endif

  return []
endfunction

let s:cal = '  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31'
if !exists('g:calendar_dow')
  let g:calendar_dow   = ' Su Mo Tu We Th Fr Sa'
  if g:calendar_jp
    let g:calendar_dow = ' 日 月 火 水 木 金 土'
  endif
endif
if !exists('g:calendar_month')
  let g:calendar_month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  if g:calendar_jp == 2
    let g:calendar_month = ['睦月  ', '如月  ', '弥生  ', '卯月  ', '皐月  ', '水無月', '文月  ', '葉月  ', '長月  ', '神無月', '霜月  ', '師走  ']
  endif
endif
function! s:CalendarStr(row, col)
  let mode = a:col != 1
  let loop = a:row*a:col
  let glist = []
  if mode
    let glist = ['', '', '', '', '', '', '', '',]
  endif
  let tail = g:calendar_mark =~ 'right' ? ' ' : ''
  let year  = exists('b:calendar_year' ) ? b:calendar_year  : strftime('%Y')
  let month = exists('b:calendar_month') ? b:calendar_month : strftime('%m')
  let day   = exists('b:calendar_day'  ) ? b:calendar_day   : strftime('%d')
  let time = DatelibDate2IntStrftime(year, month, day) * 24*60*60
  let b:calendar_year  = strftime('%Y', time)
  let b:calendar_month = strftime('%m', time)
  let b:calendar_day   = strftime('%d', time)
  let month -= (loop > 2)
  for cnt in range(loop)
    let fday = DatelibDate2IntStrftime(year, month, 1)
    let time = fday * 24*60*60
    let year  = strftime('%Y', time)
    let month = strftime('%m', time)
    let day   = strftime('%d', time)
    let str = s:cal
    let eom = DatelibEndOfMonth(year, month, 0)
    let str = substitute(str, printf('\s%2.2d', eom+1).'.*$', '', '')
    if g:calendar_mark =~ 'right'
      let str = substitute(str, '^ ', '', '').' '
    endif
    let fdow = DatelibDoWIdxStrftime(fday)
    " 日曜から始める(0000/01/01は月曜)
    let fdow = fdow == 6 ? 0 : (fdow+1)
    for n in range(fdow)
      let str  = '   '.str
    endfor
    let ty = strftime('%Y')
    let tm = strftime('%m')
    let td = str2nr(strftime('%d'))
    let sign_cmd = 'let id = '.g:calendar_sign.'(n, month, year)'
    for n in range(1, eom)
      exe sign_cmd
      if n == td && month == tm && year == ty
        let id = '*'
      endif
      if id != ''
        let id = id[0]
        if id !~ "[+!#$%&@?*]"
          let id = "+"
        endif
        if g:calendar_mark =~ 'left-fit'
          let str = substitute(str, printf('%3d', n), printf('%3s', id.string(n)), '')
        elseif g:calendar_mark =~ 'right'
          let str = substitute(str, printf('%2d ', n), printf('%2d%s', n, id), '')
        else
          let str = substitute(str, printf('%3d', n), printf('%s%2d', id, n), '')
        endif
      endif
    endfor
    let str = substitute(str, '\(.\{21}\)', '\1|', 'g')
    let list = split(str, '|')
    exe 'let list[-1] .= printf("%'.(strlen(list[0])-strlen(list[-1])).'s", "")'
    if g:calendar_mark =~ 'right'
      call map(list, 'substitute(v:val, "^", " ", "")')
    endif
    call insert(list, g:calendar_dow.tail)
    let mruler = printf(' < . > %4.4d/%2.2d ', year, month)
    let mstr = g:calendar_month[month-1].tail
    let mlen = g:calendar_jp == 2 ? 0 : strlen(list[2])-strlen(mruler)-strlen(mstr)
    let mruler .= mstr . repeat(' ', mlen)
    call insert(list, mruler)
    call map(list, 'substitute(v:val, "^", b:submenu_calendar_lmargin, "")')
    let month += 1
    if mode == 0
      if a:row > 1 || a:col > 1
        call extend(list, ['_'.repeat(' ', strlen(list[2])-1)])
      endif
      call extend(glist, list)
    else
      for idx in range(len(glist))
        let str = len(list) > idx ? list[idx] : ''
        let glist[idx] .= str . repeat(' ', strlen(list[2])-strlen(str)) .' |'
      endfor
    endif
  endfor
  if mode
    call extend(glist, ['_'])
  endif
  return glist
endfunction

function! s:SCBufWinLeave(pbuf, cbuf)
  if expand('<abuf>') == a:pbuf
    exe 'augroup SubmenuCalendar'.a:cbuf
      au!
    augroup END
    let winnr = bufwinnr(a:cbuf)
    if winnr != -1
      exe winnr.'wincmd w'
      silent! close
    endif
  elseif expand('<abuf>') == a:cbuf
    exe 'augroup SubmenuCalendar'.a:cbuf
      au!
    augroup END
    let winnr = bufwinnr(a:pbuf)
    if winnr != -1
      exe winnr.'wincmd w'
      if exists('*qfixmemo#SubMenuBufAutoWrite')
        call qfixmemo#SubMenuBufAutoWrite(fnamemodify(bufname(a:pbuf), ':p'))
      endif
      silent! close
    endif
  endif
endfunction

function! s:SCBufEnter(pbuf, cbuf)
  if !exists('b:calendar_resize')
    return
  endif
  if expand('<abuf>') == a:cbuf
    if b:calendar_resize
      if b:calendar_dircmd !~ 'vert'
        let w = &lines - winheight(0) - &cmdheight - (&laststatus > 0 ? 1 : 0)
        if w > 0
          if winheight(0) < b:calendar_height
            exe 'resize '.b:calendar_height
          endif
        endif
      else
        if exists('g:calendar_width_'.a:pbuf)
          exe "let b:calendar_width = g:calendar_width_".a:pbuf
        endif

        if winwidth(0) < b:calendar_width || b:calendar_resize " == 1
          exe 'vertical resize '.b:calendar_width
        endif
      endif
    endif
    let save_cursor = getpos('.')
    call cursor(1, 1)
    exe 'normal! z-'
    call setpos('.', save_cursor)
  endif
endfunction

function! s:winfixheight(h)
  if b:calendar_winfixheight
    exe 'resize '.a:h
  endif
endfunction

function! s:syntax()
  syn clear
  exe 'syn match CalSaturday display /\d\+.\?$/'
  exe 'syn match CalSaturday display /\d\+.\?\s\{,2}\ze|/'

  " today
  if g:calendar_mark =~ 'left-fit'
    syn match CalToday display "\s*[*]\d\+"
    syn match CalMemo display "\s*[+!$%&?]\d\+"
  elseif g:calendar_mark =~ 'right'
    syn match CalToday display "\d\+[*]\s*"
    syn match CalMemo display "\d\+[+!$%&?]\s*"
  else
    syn match CalToday display "[*]\s*\d\+"
    syn match CalMemo display "[+!$%&?]\s*\d\+"
  endif

  " header
  syn match CalHeader display '< \. > \d\{4}/\d\{2} [^ ]\+' contains=CalCmd
  syn match CalCmd '< \. >' contained

  " ruler
  exe 'syn match CalRulerNC display  "'.substitute(g:calendar_dow, '^\s*\|\s*$', '', '').'"'
  exe 'syn match CalSunday  display "'.'^'.b:submenu_calendar_lmargin.' \?[+!$%&?]\? \{,2}\d\+" contains=CalToday'
  exe 'syn match CalSunday  display "'.'|\zs'.b:submenu_calendar_lmargin.' \?[+!$%&?]\? \{,2}\d\+" contains=CalToday'
  syn match CalInfo display '\s*_.*$' contains=CalConceal

  exe 'runtime! syntax/'.g:submenu_calendar_syntax
  hi def link CalCmd      Type
  hi def link CalNavi     Search
  hi def link CalSaturday Statement
  hi def link CalSunday   Type
  hi def link CalRuler    StatusLine
  hi def link CalRulerNC  StatusLineNC
  hi def link CalWeeknm   Comment
  hi def link CalToday    Directory
  hi def link CalHeader   Special
  hi def link CalMemo     PreProc
  hi def link CalInfo     Identifier
endfunction

if !exists('g:howm_calendar_wincmd')
  let g:howm_calendar_wincmd = 'vertical topleft'
  " let g:howm_calendar_wincmd = 'vertical botright'
endif
if !exists('g:howm_calendar_count')
  let g:howm_calendar_count = 3
endif
if !exists('g:howm_calendarh_wincmd')
  " let g:howm_calendarh_wincmd = 'leftabove'
  let g:howm_calendarh_wincmd = 'rightbelow'
endif
if !exists('g:howm_calendarh_count')
  let g:howm_calendarh_count = 4
endif

function! HowmCalendar(...)
  let dir = a:0 ? a:1 : 0
  let vyear = a:0 > 1 ? str2nr(a:2) : 0
  let vmnth = a:0 > 2 ? str2nr(a:3) : 0
  if dir
    let wincmd = g:howm_calendarh_wincmd
    let ccount = g:howm_calendarh_count
  else
    let wincmd = g:howm_calendar_wincmd
    let ccount = g:howm_calendar_count
  endif
  call QFixMemoCalendar(wincmd, '__Calendar__', ccount)
  if vyear == 0 && vmnth == 0
    call s:CR('today')
  else
    let b:calendar_year  = vyear > 0 ? vyear : str2nr(strftime('%Y'))
    let b:calendar_month = vmnth > 0 ? vmnth : str2nr(strftime('%m'))
    call s:build()
  endif
endfunction

"=============================================================================
"    Description: date & holiday library
"         Author: fuenor <fuenor@gmail.com>
"                 http://sites.google.com/site/fudist/Home/qfixhowm
"=============================================================================
scriptencoding utf-8
let s:version = 100
if exists('g:datelib_version') && g:datelib_version < s:version
  let g:loaded_datelib_vim = 0
endif
if exists("g:loaded_datelib_vim") && g:loaded_datelib_vim && !exists('fudist')
  finish
endif
let g:datelib_version = s:version
let g:loaded_datelib_vim = 1
if v:version < 700 || &cp
  finish
endif

" strftime()基準の経過日数
function! DatelibDate2IntStrftime(year, month, day)
  return s:Date2Int(a:year, a:month, a:day) - g:DateStrftime
endfunction

" strftime()基準の曜日インデックス
" strftime()基準の経過日数から曜日インデックスを返すので g:DoWStrftime[idx] として使用する
" let idx = DatelibDoWIdxStrftime(DatelibDate2IntStrftime(year, month, day))
" let idx = DatelibDoWIdxStrftime(year, month, day)
function! DatelibDoWIdxStrftime(...)
  if a:0 == 1
    return (a:1 + g:DateStrftime)%7
  endif
  if a:0 == 3
    return (s:Date2Int(a:1, a:2, a:3)%7)
  endif
  return 0
endfunction

function! s:Date2Int(year, month, day)
  let year = a:year
  let month = a:month
  let day = a:day
  " 1・2月 → 前年の13・14月
  if month <= 2
    let year = year - 1
    let month = month + 12
  endif
  let dy = 365 * (year - 1) " 経過年数×365日
  let c = year / 100
  let dl = (year / 4) - c + (c / 4)  " うるう年分
  let dm = (month * 979 - 1033) / 32 " 1月1日から month 月1日までの日数
  let today = dy + dl + dm + day - 1
  return today
endfunction

" 曜日変換、シフトを行ったstrfime時間
" strftime()で使用可能
" cnvdow : 2*Mon, 3*Tue, etc.
" sft    : -1, +2, -Sun, +Wed, -Hol, etc.
function! DatelibStrftimeCnvDoWShift(year, month, day, cnvdow, sft)
  let year  = a:year
  let month = a:month
  let day   = a:day
  if day == 0
    let day = DatelibEndOfMonth(year, month, day)
  endif
  let sft   = a:sft

  let cnvdow = matchstr(a:cnvdow, '\(\d\s*\*\)\?\s*'.s:DoWregxp)
  if cnvdow == ''
    let dday = DatelibDate2IntStrftime(year, month, day)
    let time = dday * 24*60*60
  else
    let dow = substitute(cnvdow, '[*0-9]', '', 'g')
    let cnvdow = substitute(cnvdow, '[^0-9]', '', 'g')
    if cnvdow == 0 || cnvdow == ''
      let cnvdow = 1
    endif
    let fday = DatelibDate2IntStrftime(year, month, 1)
    let fdow = DatelibDoWIdxStrftime(fday)
    let dday = fday - fdow
    let dday += (cnvdow-1) * 7 + index(g:DoWStrftime, dow)
    let time = dday * 24*60*60
    let month = strftime('%m', time)
    if fdow > index(g:DoWStrftime, dow)
      let time += 7*24*60*60
    endif
  endif
  if sft =~ '[-+]\?\s*\d\+'
    let time += str2nr(sft)*24*60*60
  elseif sft =~ '[-+]\s*\c\(Hol\|Hdy\)'
    let t = str2nr(substitute(sft, '\c\(Hol\|Hdy\)', '1', '')) * 24*60*60
    while 1
      let y = strftime('%Y', time)
      let m = strftime('%m', time)
      let d = strftime('%d', time)
      let date = printf('%4.4d%2.2d%2.2d', y, m, d)
      if exists('s:holidaytbl[date]') == 0
        break
      endif
      let time += t
    endwhile
  elseif sft =~ '[-+]\s*'.s:DoWregxp
    let fday = time / (24*60*60)
    let fdow = DatelibDoWIdxStrftime(fday)
    if sft =~ g:DoWStrftime[fdow]
      let time += (sft =~ '+' ? 1 : -1) * 24*60*60
    endif
  endif
  return time
endfunction

" 月末
function! DatelibEndOfMonth(year, month, day)
  let year = a:year
  let month = a:month
  if month > 12
    let year += 1
    let month = month - 12
  endif
  let monthdays = [31,28,31,30,31,30,31,31,30,31,30,31]
  if (year%4 == 0 && year%100 != 0) || year%400 == 0
    let monthdays[1] = 29
  endif
  let day = a:day
  if monthdays[month-1] < day
    let day = monthdays[month-1]
  endif
  if day == 0
    let day = monthdays[month-1]
  endif
  return day
endfunction

" strftime()の基準年
if !exists('g:YearStrftime')
  let g:YearStrftime = 1970
endif
" strftime()の基準日数(1970-01-01)
if !exists('g:DateStrftime')
  let g:DateStrftime = s:Date2Int(g:YearStrftime, 1, 1)
endif
" 初週曜日(0000-01-01)
if !exists('g:DoWStrftime')
  let g:DoWStrftime = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
endif

"=============================================================================
" howmスタイル休日設定

" 休日定義ファイル
" https://sites.google.com/site/fudist/Home/qfixhowm#downloads
if !exists('g:calendar_holidayfile')
  " let g:calendar_holidayfile = '~/qfixmemo/Sche-Hd-0000-00-00-000000.howm'
  let g:calendar_holidayfile = ''
endif

""""""""""""""""""""""""""""""
" 指定日が休日かチェック
" 追加オプションがある場合、指定曜日は除く
" (主に日曜を排除するためにある)
""""""""""""""""""""""""""""""
function! DatelibHolidayCheck(year, month, day, ...)
  call DatelibMakeHolidayTable(a:year)
  let date = printf('%4.4d%2.2d%2.2d', a:year, a:month, a:day)
  if a:0
    let fday = DatelibDate2IntStrftime(a:year, a:month, a:day)
    let fdow = DatelibDoWIdxStrftime(fday)
    return (g:DoWStrftime[fdow] !~ a:1) * (exists('s:holidaytbl[date]') ? 1 : 0)
  endif
  return (exists('s:holidaytbl[date]') ? 1 : 0)
endfunction

""""""""""""""""""""""""""""""
" 少なくとも指定年の休日定義が含まれる辞書を返す
""""""""""""""""""""""""""""""
function! DatelibGetHolidayTable(year)
  call DatelibMakeHolidayTable(a:year)
  return s:holidaytbl
endfunction

" 指定年の予定を作成
let s:holidaytbl  = {}
let s:holidaydict = []
let s:usertbl  = {}
let s:userdict = []
function! DatelibMakeHolidayTable(year, ...)
  let hol = a:0
  for year in range(a:year-1, a:year+1)
    let yearid = year. (hol ? 'Hol' : '')
    if !exists('s:holidaytbl[yearid]')
      let s:holidaytbl[yearid] = '|exists|'
      if len(s:holidaydict) == 0
        let s:holidaydict = s:ReadScheduleFile(s:setholidayfile(), s:holidaytbl)
      endif
      call s:SetScheduleTable(year, s:holidaydict, s:holidaytbl, hol)
      if exists('g:calendar_userfile')
        if len(s:userdict) == 0
          let s:userdict = s:ReadScheduleFile(g:calendar_userfile, s:usertbl)
        endif
        call s:SetScheduleTable(year, s:userdict, s:usertbl, hol)
      endif
    endif
  endfor
endfunction

" 休日定義ファイルを読み込み
let s:DoWregxp = '\c\(Sun\|Mon\|Tue\|Wed\|Thu\|Fri\|Sat\|Hol\|Hdy\)'
function! s:ReadScheduleFile(files, table)
  let dict = []
  for file in a:files
    if !filereadable(file)
      continue
    endif
    let glist = readfile(file)
    if exists('g:qfixmemo_fileencoding')
      call map(glist, "iconv(v:val, g:qfixmemo_fileencoding, &enc)")
    endif
    let today = strftime('%Y%m%d')
    let sch_ext  = '-@!+~.'
    let sch_date = '^.\d\{4}.\d\{2}.\d\{2}.'
    let sch_dow  = s:DoWregxp
    let sch_cmd  = '['.sch_ext.']\{1,3}\(([0-9]*[-+*]\?'.sch_dow.'\?\([-+]\d\+\)\?)\)\?[0-9]*'
    for str in glist
      let date = matchstr(str, sch_date)
      let date = substitute(date, '[^0-9]', '', 'g')
      let year  = strpart(date, 0,  4)+0
      let month = strpart(date, 4,  2)+0
      let day   = strpart(date, 6,  2)+0
      let str = substitute(str, sch_date, '', '')
      let cmdstr = matchstr(str, '^'.sch_cmd)
      if cmdstr == ''
        continue
      endif
      let cmd = matchstr(cmdstr, '['.sch_ext.']\+')
      let opt = matchstr(cmdstr, '\d*$')
      let cnvdow = matchstr(cmdstr, '(\(\d\*\)\?'.sch_dow)
      let cnvdow = substitute(cnvdow, '(', '', '')
      let sft = matchstr(cmdstr, '[-+]\(\d\+\|'.sch_dow.'\))')
      let sft = substitute(sft, ')', '', '')
      let repeat = matchstr(cmdstr, '(\d\+')
      let repeat = substitute(repeat, '(', '', '')
      let text = substitute(str, '^'.sch_cmd, '', '')
      if cmd == '@'
        if repeat == '' && sft !~ '\c\(Hol\|Hdy\)'
          let opt = (opt == '' || opt == 0) ? 1 : opt
          let time = DatelibStrftimeCnvDoWShift(year, month, day, cnvdow, sft)
          for i in range(opt)
            let date = strftime('%Y%m%d', time)
            let a:table[date] = text
            let time += 24*60*60
          endfor
          continue
        endif
      elseif cmd == '@@'
      elseif cmd == '@@@'
      else
        continue
      endif
      let hday = {'cmd':cmd, 'year':year, 'month':month, 'day':day, 'repeat':repeat, 'cnvdow':cnvdow, 'sft':sft, 'opt':opt, 'text':text}
      call add(dict, hday)
    endfor
  endfor
  return deepcopy(dict)
endfunction

function! s:setholidayfile()
  if g:calendar_holidayfile != ''
    let file = g:calendar_holidayfile
  elseif exists('g:QFixHowm_HolidayFile')
    let file = g:QFixHowm_HolidayFile
  else
    let file = 'Sche-Hd-0000-00-00-000000.*'
  endif
  if exists('g:QFixHowm_ScheduleSearchDir') && g:QFixHowm_ScheduleSearchDir != ''
    let l:howm_dir = g:QFixHowm_ScheduleSearchDir
  elseif exists('g:qfixmemo_root')
    let l:howm_dir = g:qfixmemo_root
  elseif exists('g:QFixHowm_RootDir')
    let l:howm_dir = g:QFixHowm_RootDir
  elseif exists('g:qfixmemo_dir')
    let l:howm_dir = g:qfixmemo_dir
  elseif exists('g:howm_dir')
    let l:howm_dir = g:howm_dir
  else
    let l:howm_dir = '~'
  endif
  let prevPath = escape(getcwd(), ' ')
  silent! exe 'lchdir ' . escape(l:howm_dir, ' ')
  let file = fnamemodify(file, ':p')
  exe 'lchdir ' . prevPath
  let file = substitute(expand(file), "\<NL>.*", '', '')
  let file = substitute(file, '\\', '/', 'g')
  return split(file, "\<NL>")
endfunction

function! s:SetScheduleTable(year, dict, table, hol)
  if len(a:dict)
    for d in a:dict
      if a:year < d['year']
        continue
      endif
      if !a:hol && d['sft'] =~ '\c\(Hol\|Hdy\)'
        continue
      elseif a:hol && d['sft'] !~ '\c\(Hol\|Hdy\)'
        continue
      endif
      if d['cmd'] == '@@@'
        let time = DatelibStrftimeCnvDoWShift(a:year, d['month'], d['day'], d['cnvdow'], d['sft'])
        let date = strftime('%Y%m%d', time)
        let a:table[date] = d['text']
        let opt = d['opt']
        let opt = (opt == '' || opt == 0) ? 1 : opt
        for i in range(opt)
          let date = strftime('%Y%m%d', time)
          let a:table[date] = d['text']
          let time += 24*60*60
        endfor
      elseif d['cmd'] == '@@'
        let opt = d['opt']
        let opt = (opt == '' || opt == 0) ? 1 : opt
        let start = a:year == d['year'] ? d['month'] : 1
        for month in range(start, 12)
          let time = DatelibStrftimeCnvDoWShift(a:year, month, d['day'], d['cnvdow'], d['sft'])
          for i in range(opt)
            let date = strftime('%Y%m%d', time)
            let a:table[date] = d['text']
            let time += 24*60*60
          endfor
        endfor
      elseif d['cmd'] == '@'
        " 単発予定は読み込み時に処理済み
        let opt = d['opt']
        let opt = (opt == '' || opt == 0) ? 1 : opt

        let smonth = a:year == d['year'] ? d['month'] : 1
        let sday   = a:year == d['year'] ? d['day']   : 1
        let repeat = d['repeat']
        let repeat = (repeat == '' || repeat <= 0) ? 1 : repeat
        let begin = DatelibDate2IntStrftime(d['year'], d['month'], d['day'])
        let begin += (repeat) * ((DatelibDate2IntStrftime(a:year, smonth, sday) - begin)/repeat)
        let time  = begin * 24*60*60
        let year  = strftime('%Y', time)
        let month = strftime('%m', time)
        let day   = strftime('%d', time)
        for rday in range(day, day+366, repeat)
          let time = DatelibStrftimeCnvDoWShift(year, month, rday, d['cnvdow'], d['sft'])
          for i in range(opt)
            let date = strftime('%Y%m%d', time)
            if stridx(date, a:year) != 0
              continue
            endif
            let a:table[date] = d['text']
            let time += 24*60*60
          endfor
        endfor
      else
        continue
      endif
    endfor
  endif
  return a:table
endfunction

"=============================================================================
" for CalendarInfo
"=============================================================================
au VimEnter * call <SID>SetCalendarInfoPreview()

function! s:SetCalendarInfoPreview()
  " myqfix.vimが有効か判定している
  if !exists('#QFix')
    if !exists('g:QFix_PreviewUpdatetime')
      let g:QFix_PreviewUpdatetime = 17
    endif
    let g:QFix_DefaultUpdatetime = &updatetime
    augroup QFix
      au!
      au BufEnter,BufLeave * call <SID>SetUpdatetime()
    augroup END
  endif
endfunction

""""""""""""""""""""""""""""""
" b:qfixwin_updatetimeが存在すればupdatetimeを設定
function! s:SetUpdatetime()
  if exists('b:qfixwin_updatetime') && b:qfixwin_updatetime
    exe 'setlocal updatetime='.g:QFix_PreviewUpdatetime
  else
    if &updatetime != g:QFix_PreviewUpdatetime
      let g:QFix_DefaultUpdatetime = &updatetime
    endif
    exe 'setlocal updatetime='.g:QFix_DefaultUpdatetime
  endif
endfunction

