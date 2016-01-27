exists = (file_name) ->
    fh = io.open file_name, 'r'
    if fh ~= nil
        io.close fh
        return true
    else
        return false

-- File.open file_name, 'w', (fh) ->
--     fh.write 'foo'

open = (file_name, mode, proc) ->
    fh = io.open file_name, mode
    proc fh
    io.close fh

{ :exists, :open }
