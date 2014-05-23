class (exports ? this).Probability
  constructor: (@matrix) ->

  add_section: (ar) ->
    @matrix.push ar
    return this

  get_one: ->
    chance = (parseInt(m[0],10) for m in @matrix).reduce((x,y) -> x + y)
    random = 1 + Math.floor(Math.random() * chance)
    @get(random)

  get: (c) ->
    up=0
    for m in @matrix
      up += m[0]
      return m[1] if up >= c
    return undefined
###
    if typeof (it[@value]) is 'number'
      out = (it[@next].get_one() for i in it[@value]).join(', ')
    out + ', ' + it.get_one()  if b
###
