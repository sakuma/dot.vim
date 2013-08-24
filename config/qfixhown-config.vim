" qfixappにruntimepathを通す(パスは環境に合わせてください)
set runtimepath+=~/.vim/bundle/qfixhome
set runtimepath+=~/.vim/bundle/qfixgrep

" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = '~/.vim/data/qfixhown'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'

" let calendar_action = "QFixHowmCalendarDiary"
" let calendar_sign   = "QFixHowmCalendarSign"
"
" プレビュー対象外ファイルの指定
let QFix_PreviewExclude = '\.pdf$\|\.mp3$\|\.jpg$\|\.bmp$\|\.png$\|\.zip$\|\.rar$\|\.exe$\|\.dll$\|\.lnk$'
" プレビューウィンドウの高さ(Vim設定値)
set previewheight=12
" プレビューウィンドウの高さ(previewheightを使用したくない場合のみ指定)
let QFix_PreviewHeight = 12
" プレビューウィンドウの幅
let QFix_PreviewWidth  = 0
" プレビューウィンドウの開き方指定
let QFix_PreviewOpenCmd = ''
" プレビュー画面のカーソルラインを表示
let QFix_PreviewCursorLine = 1
" プレビューウィンドウの折り返し表示
let QFix_PreviewWrap = 1

""""
" QFixGrep"
"
"
" unix
" 日本語を含む場合のみagrep.vimで検索する
" let mygrepprg   = 'grep'
" let myjpgrepprg = 'agrep.vim'
" let MyGrep_MultiEncodingGrepScript = 1
let MyGrep_error = 1
"Grepコマンドのキーマップ
let MyGrep_Key  = 'g'
"Grepコマンドの2ストローク目キーマップ
let MyGrep_KeyB = ','

""Grepの対象にしたくないファイルは正規表現で指定できます。
let MyGrep_ExcludeReg = '[~#]$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$\|^tags$'
" デフォルトでは
" *~ *# *.bak *.o *.obj *.exe tags
" が対象外になります。
" /svn/... のように 対象にしたくないpathも指定できます。
let MyGrep_ExcludeReg = '[/\\]svn[/\\]'
" Windowsの場合は、shellslash を設定してやると、パスの表記が簡単になります。
" set shellslash
let MyGrep_ExcludeReg = '/CVS/'

" 外部grepに独自のオプションを指定して実行したい場合は、 MyGrepcmd_useroptに設定します。
" grepで --exclude が使えるなら MyGrepcmd_useroptに設定してやると検索が速くなります。
let MyGrepcmd_useropt = '--exclude-dir=CVS'

"" default
let mygrepprg = 'internal'
" let mygrepprg = 'grep'
" let MyGrep_ShellEncoding = 'utf-8'


