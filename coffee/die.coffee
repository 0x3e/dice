class (exports ? this).Die
  constructor: (@faces) ->
    @faces = parseInt(@faces,10)
    @roll()

  roll: ->
    return unless @faces
    @score = 1 + (Math.random() * @faces) // 1
