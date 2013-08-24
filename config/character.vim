"
"文字コードを指定してファイルを開きなおす †
"普通は上記の自動認識で問題ないと思うが、それでも文字化けする場合や、わざと違う文字コードで開いてみたい場合に使う。
"
"例えば以下のようにするとeuc-jpでファイルを開き直せる。
"
""""""""""
":e ++enc=euc-jp
"
"文字コードを変更して保存する †
"cp932 (Shift-JIS) にするには以下のようにする。
"
""""""""""
":set fileencoding=cp932
"
"改行コードを変更する †
"""""""""
":set fileformat=改行コードの種類
"
"ff は fileformat の短い形式なので ff でも良い。
"改行コードの種類で指定できるのは dos, max, unix の３つです。
"
"例）Windows形式の改行コードに変更するには以下のようにします。
"""""""
":set fileformat=dos
"
"""""""""""""""""""""""""""""""""""""""""""""
"改行コードの見分け方（UNIX環境前提） †
"改行コードが unix でない場合、^M
"という文字が大量に表示されることがあります。これは mac
"で使われる改行文字です。
"これを見たらきっと改行コードが違うんだなと思ってください。
"
"見分け方は以下の通りです。
"
"普通に改行されていて特に問題を感じない → 改行コードは unix
"全ての行末に ^M がくっついている → 改行コードは dos
"^M が沢山表示されるうえに全てが1行に表示されてしまう → 改行コードは mac
"改行コードが分かったら以下を実行すれば正常に表示されるようになります。(dosと分かった場合)
"""""""""""""""""""""""""""""""""""""""""""""

" 文字コード, 改行コード {{{
set encoding=utf-8
set fileencodings=ucs_bom,utf8,ucs-2le,ucs-2
set fileformats=unix,dos,mac

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = s:fileencodings_default .','. &fileencodings
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" }}}
