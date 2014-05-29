class (exports ? this).Die
  constructor: (faces) ->
    @_faces = parseInt(faces,10)
    @roll()

  roll: ->
    return unless @_faces
    @_score = 1 + (Math.random() * @_faces) // 1

  get_faces: -> @_faces
  get_score: -> @_score
