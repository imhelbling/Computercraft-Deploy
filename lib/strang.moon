
trim = (str) ->
  str\gsub("^%s+", "")\gsub("%s+$", "")

split = (str, delimiter) ->
  delimiter, values = delimiter or " ", {}
  pattern = string.format("([^%s]+)", delimiter)
  str\gsub pattern, (captured) ->
    table.insert(values, captured)
  values

join = (list, delimiter) ->
  table.concat list, delimiter

{ :trim, :split, :join }
