file = require 'lib.file'

describe "file", ->
    describe "open with sandwich code", ->
        it "can read a file", ->
            result = ""
            file.open 'spec/fixtures/readable_file.txt', 'r', (fh) ->
                result = fh\read "*all"
                assert.equal "This is a readable file.\n", result



