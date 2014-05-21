$0x3e = exports? and exports or @$0x3e = this
class $0x3e.Die
  constructor: (@faces) ->
    @faces = parseInt(@faces,10)
    @score = @roll()
    return

  roll: ->
    return unless @faces
    1 + Math.floor(Math.random() * @faces)
