let s:Object = {'_type': 'object', '_extends':[]}

" Create new object instance.
function! s:Object.new() dict
    return copy(self)
endfunction

" Base method for originating child objects.
function! s:Object.originate(type, blueprint) dict
    let base = copy(self)
    let base._type = a:type
    let base._parent = self
    let base._extends = add(base._extends, self._type)

    return extend(base, a:blueprint)
endfunction

" Check if value is a valid object of the same type.
function! s:Object.isSameAs(value) dict
    if !self.isValidTypeableObject(a:value)
        return 0
    endif

    return self._type == a:value._type
endfunction

" Check if value is a valid instance of given type.
function! s:Object.isInstanceOf(value) dict
    if !self.isValidTypeableObject(a:value)
        return 0
    endif

    return index(self._extends, a:value._type) >= 0
endfunction

function! s:Object.isValidTypeableObject(value) dict
    if type(a:value) != v:t_dict
        return 0
    endif

    if !has_key(a:value, '_type') 
        return 0
    endif

    return 1
endfunction

let g:gitpowder#lib#object# = s:Object
