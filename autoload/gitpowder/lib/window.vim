let s:Window = g:gitpowder#lib#object#.originate('window', {
            \   'id': 0,
            \   'buffer': 0, 
            \   'is_visible': 0,
            \   'is_vertical': 0
            \})

" Create new window instance.
function! s:Window.new(buffer, is_vertical) dict
    if !g:gitpowder#lib#buffer#.sameAs(a:buffer)
        echoerr 'Argument "buffer" must be of type "g:gitpowder#libl#buffer#"!'   
        return
    endif

    let new = copy(self)
    let new.buffer = a:buffer
    let new.is_vertical = a:is_vertical

    call new.show()

    return new
endfunction

" Return 1 if window is present on active tab and 0 otherwise.
function! s:Window.isVisible() dict
    if self.getNumber() != 0
        return 1
    else
        return 0
    endif
endfunction

" Get window number on active tab. Return 0 if window is not found.
function! s:Window.getNumber() dict
    return win_id2win(self.id)
endfunction

" Hide or show window depending on its current visibility.
function! s:Window.toggle() dict
    if self.isVisible()
        call self.hide()
    else
        call self.show()
    endif
endfunction

" Hide window (only if its currently visible).
function! s:Window.hide() dict
    if !self.isVisible()
        return
    endif

    execute 'close ' . self.getNumber()
endfunction

" Update window buffer and show window (only if its not visible).
function! s:Window.show() dict
    " We update buffer's content first.
    call self.buffer.update()

    if self.isVisible()
        return
    endif

    if self.is_vertical
        let command = 'vnew'
    else
        let command = 'new'
    endif

    execute command
    execute 'buffer ' . self.buffer.number
    let self.id = win_getid()
endfunction

let g:gitpowder#lib#window# = s:Window
