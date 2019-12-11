let s:Object = g:gitpowder#lib#object#
let s:Window = s:Object.originate({
            \   'id': 0,
            \   'visibility': 0,
            \   'is_vertical': 0,
            \})

function! s:Window.new(is_vertical) dict
    let new = copy(self)
    let new.is_vertical = a:is_vertical

    call new.show()

    return new
endfunction

function! s:Window.getWindowNumber() dict
    return win_id2win(self.id)
endfunction

function! s:Window.toggle() dict
    if self.isVisible()
        self.hide()
    else
        self.show()
    endif
endfunction

function! s:Window.hide() dict
    let self.visibility = 0

    echo self.getWindowNumber()
    execute "close " . self.getWindowNumber()
endfunction

function! s:Window.show() dict
    let self.visibility = 1

    if self.is_vertical
        let command = "vnew"
    else
        let command = "new"
    endif

    execute command
    let self.id = win_getid()
endfunction

let g:gitpowder#lib#window# = s:Window
