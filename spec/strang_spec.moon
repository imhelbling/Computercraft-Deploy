strang = require 'lib.strang'

describe "strang", ->
    describe "#trim", ->

        it "removes leading whitespace", ->
            subject = "  foo"
            result = strang.trim subject
            assert.equal result, "foo"

        it "removes trailing whitespace", ->
            subject = "foo  "
            result = strang.trim subject
            assert.equal result, "foo"

        it "removes both leading and trailing whitespace", ->
            subject = "  foo  "
            result = strang.trim subject
            assert.equal result, "foo"

    describe "#split", ->
        it "splits a string into a vector table", ->
            subject = "one, two, three"
            result = strang.split subject, ", "
            assert.are.same { "one", "two", "three" }, result

        it "splits with a regex", ->
            subject = "one, two,three"
            result = strang.split subject, ", *"
            assert.are.same { "one", "two", "three" }, result

    describe "#join", ->
        it "joins a vector table elements", ->
            subject = { "foo", "bar", "baz" }
            result = strang.join subject, "::"
            assert.equal "foo::bar::baz", result

