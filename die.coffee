module.exports = class Die
  constructor: (@faces) ->
    @score = @roll()
    return

  roll: ->
    if isNaN parseInt(@faces)
      return
    1 + Math.floor(Math.random() * @faces)
