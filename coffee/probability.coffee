class (exports ? this).Probability
  ###
  # type is very important
  ###
  constructor: (@table) -> return

  add_section: (ar) ->
    @table.push ar
    return this

  get_string: (which,join_string) ->
    return ([].concat @get(which)).join(join_string)

  get: (which) ->
    which ?= 1 + (Math.random() * @get_total_entries()) // 1
    row = @_get_row which
    @_get_next(row)

  _get_next: (row) ->
    if typeof (row[1]) is 'number'
      out = (row[2].get() for r in [1..row[1]])
    else
      out = [row[1]]
      out.push(row[2].get()) if row[2]
    out

  _get_row: (c) ->
    return [] unless c
    up = 0
    for m in @table
      up += m[0]
      return m if up >= c
    return []

  get_total_entries: ->
    (parseInt(m[0], 10) for m in @table).reduce((x, y) -> x + y)

