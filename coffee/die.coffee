class (exports ? this).Die
  constructor: (@faces) ->
    @faces = parseInt(@faces,10)
    @score = @roll()
    return

  roll: ->
    return unless @faces
    1 + Math.floor(Math.random() * @faces)
