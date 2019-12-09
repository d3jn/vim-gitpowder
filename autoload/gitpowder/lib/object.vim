let s:Object = {'_type': 'obj'}

function! s:Object.originate(blueprint) dict
    let base = copy(self)
    let base._parent = self

    return extend(base, a:blueprint)
endfunction

let g:gitpowder#lib#object# = s:Object
