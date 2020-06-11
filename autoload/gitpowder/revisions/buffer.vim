let s:RevisionsBuffer = g:gitpowder#lib#buffer#.originate('revisions_buffer', {
            \   'revisions': []
            \})

" Create new revisions buffer instance.
function! s:RevisionsBuffer.new(revisions) dict
    let new = copy(self)

    return new
endfunction

" Update buffer's content.
function! s:RevisionsBuffer.update() dict
    call deletebufline(self.number, 1, '$')
    call setbufline(self.number, 1, [
                \   'This is empty buffer',
                \   'Override update() method to change this content!',
                \])
endfunction

let g:gitpowder#revisions#buffer# = s:RevisionsBuffer
