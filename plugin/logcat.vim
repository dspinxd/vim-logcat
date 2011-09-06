" Trivial utility for logcat(Log of Android).
" Version: 0.1.0
" Author : thinca <thinca+vim@gmail.com>
" License: Creative Commons Attribution 2.1 Japan License
"          <http://creativecommons.org/licenses/by/2.1/jp/deed.en>

if exists('g:loaded_logcat')
  finish
endif
let g:loaded_logcat = 1

let s:save_cpo = &cpo
set cpo&vim

if globpath(&runtimepath, 'plugin/vimshell.vim') !=# ''
  command! -nargs=* Logcat VimShellInteractive --encoding=utf-8 adb logcat <args>
endif

if globpath(&runtimepath, 'autoload/vimproc.vim') != ''
  command! -nargs=0 LogcatClear VimProcBang adb logcat -c
else
  command! -nargs=0 LogcatClear !adb logcat -c
endif

let &cpo = s:save_cpo
unlet s:save_cpo