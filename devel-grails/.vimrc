
" Call pathogen to make bundle work
call pathogen#infect()

" EasyGrep params
let g:EasyGrepMode=2
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=1
let g:EasyGrepIgnoreCase=1

" Most Recently Used location
let MRU_File=$HOME.'/.vim/bundle/MRU/mru_files'

" Tag list
let Tlist_Use_Right_Window=1

filetype indent plugin on

syntax on
"colorscheme benj
set nu

set smartindent " smart ident new line
set tabstop=4 " display 1 tab = 4 space
set shiftwidth=4 " put 4 space while >> or auto ident 
set expandtab " put 4 space instead of tabs 

""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   KEYMAPS
"
" Display NERDTree
map <F2> <Esc>:NERDTreeToggle<CR>
map <A-F2> <Esc>:NERDTreeFind<CR>


" Display taglist
map <F3> <Esc>:TlistToggle<CR>

"Grails run
map <F8> <Esc>:w<CR>:call GrailsRunApp()<CR>
"Grails testing
map <S-F9> <Esc>:w<CR>:call GrailsRunSingleTest()<CR>
map <F9> <Esc>:w<CR>:call GrailsRunTestFile()<CR>
map <D-F9> :call RunLastCommandInTerminal()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   FUNCTIONS
"
command! GrailsTestResults :call GrailsTestResults()

function! GrailsRunSingleTest()
	let testName = expand("%:t:r.") . "." . expand("<cword>")
	:call GrailsRunTest(testName)
endfunction

function! GrailsRunTestFile()
	let testName = expand("%:t:r")
	:call GrailsRunTest(testName)
endfunction

function! GrailsRunTest(testName)
	let path = expand("%:r")
	if path =~ "integration"
		let flag = "--integration"
	else
		let flag = "--unit"
	endif
	execute ":!grails test-app " . flag . " " . a:testName
endfunction

function! GrailsTestResults()
	silent execute ":!open target/test-reports/html/index.html"
endfunction

function! GrailsRunApp()
	execute ":!grails run-app"
endfunction


