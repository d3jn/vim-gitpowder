let s:GitpowderPlugin = {'name': 'Unnamed'}

function! gitpowder#plugin#instance()
    return copy(s:GitpowderPlugin)
endfunction

function! s:GitpowderPlugin.init() dict
    echo 'Plugin <' . self.name . '> initialized!'
endfunction
