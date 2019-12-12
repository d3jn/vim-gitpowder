let s:Buffer = g:gitpowder#lib#object#.originate('buffer', {
            \   'number': 0
            \})

" Create new buffer instance.
function! s:Buffer.new(number) dict
    let new = copy(self)
    let new.number = a:number

    return new
endfunction

" Update buffer's content.
function! s:Buffer.update() dict
    call deletebufline(self.number, 1, '$')
    call setbufline(self.number, 1, [
                \   'This is empty buffer',
                \   'Override update() method to change this content!',
                \   '',
                \   'Random shit: ' . reltimestr(reltime())
                \])
endfunction

let g:gitpowder#lib#buffer# = s:Buffer
