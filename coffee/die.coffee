class (exports ? this).Die
  constructor: (@faces) ->
    @faces = parseInt(@faces,10)
    @score = @roll()

  roll: ->
    return unless @faces
    1 + Math.floor(Math.random() * @faces)
