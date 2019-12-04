let s:ObjectClass = {}

function! gitpowder#object#create(type, title, object)
    let newObj = copy(s:ObjectClass)

    let newObj.type = a:type
    let newObj.title = a:title
    let newObj.object = a:object

    return newObj
endfunction

function! s:ObjectClass.getPrettyTitle() dict
    return self.title
endfunction
