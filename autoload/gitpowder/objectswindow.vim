let s:ObjectsWindowClass = {}

function! gitpowder#objectswindow#create(objects, title)
    let newWindow = copy(s:ObjectsWindowClass)

    let newWindow.objects = a:objects
    let newWindow.title = a:title

    return newWindow
endfunction

function! s:ObjectsWindowClass.show() dict
    new
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal nonumber
    setlocal norelativenumber

    call setline(1, self.title)

    let line = 2
    for object in self.objects
        call setline(line, object.getPrettyTitle())
        let line += 1
    endfor

    setlocal nomodifiable

    nnoremap <silent> <buffer> q :bdelete!<CR>
endfunction
