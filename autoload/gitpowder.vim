" Vim GitPowder
" Author:     Serhii Yaniuk <serhiiyaniuk@gmail.com>
" Repository: github.com/d3jn/vim-gitpowder
" License:    MIT License

function! gitpowder#ShowFileHistory()
    let versions = s:GetFileVersions()

    new
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal nonumber
    setlocal norelativenumber

    let line = 1
    for single_version in versions
        call setline(line, single_version.abbr_hash . ' | ' . single_version.subject)
    endfor

    execute 'resize ' . max([line + 1, 5])
    setlocal nomodifiable

    nnoremap <silent> <buffer> q :bdelete!<CR>
endfunction

function! s:GetFileVersions()
    let raw_versions = split(system('git log --pretty="format:%H||%h||%ar||%s||%aN"'), '\n')

    let versions = []
    for raw_version in raw_versions
        let data = split(raw_version, '||')
        let single_version = {
            \'hash': get(data, 0, '<undefined>'),
            \'abbr_hash': get(data, 1, '<undefined>'),
            \'time': get(data, 2, '<undefined>'),
            \'subject': get(data, 3, '<undefined>'),
            \'author': get(data, 4, '<undefined>')
        \}
        let versions = add(versions, single_version)
    endfor

    return versions
endfunction

