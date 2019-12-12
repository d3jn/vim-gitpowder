let s:Object = {'_type': 'object'}

" Create new object instance.
function! s:Object.new() dict
    return copy(self)
endfunction

" Base method for originating child objects.
function! s:Object.originate(type, blueprint) dict
    let base = copy(self)
    let base._type = a:type
    let base._parent = self

    return extend(base, a:blueprint)
endfunction

" Check if value is a valid object of the same type.
function! s:Object.sameAs(value) dict
    if type(a:value) != v:t_dict
        return 0
    endif

    if !has_key(a:value, '_type') 
        return 0
    endif

    return self._type == a:value._type
endfunction

let g:gitpowder#lib#object# = s:Object
