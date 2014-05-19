$0x3e = exports? and exports or @$0x3e = {}
class $0x3e.Die
  constructor: (@faces) ->
    @score = @roll()
    return

  roll: ->
    if isNaN parseInt(@faces)
      return
    1 + Math.floor(Math.random() * @faces)
