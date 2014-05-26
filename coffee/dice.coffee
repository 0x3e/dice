class (exports ? this).Dice
  Die: Die? and Die
  constructor: (@arg) ->
    @Die = Dice::Die? and Dice::Die or @Die = Die
    @match = /(\d*)\s*d\s*(\d+)\s*(.*)/
    @args = {}
    @roll() if @arg

  _parse_arg: (arg) ->
    args = {}
    @arg = arg if arg
    return {} unless @arg and typeof @arg == 'string'
    arg_match = @match.exec @arg
    return unless arg_match
    args.num = arg_match[1] or 1
    args.faces = parseInt(arg_match[2],10) or 0
    args.mod = parseInt(arg_match[3].replace(/\s/g,''), 10) or 0

    args

  roll: (arg) ->
    @_dice = []
    @args = @_parse_arg arg
    return this unless @_is_good()
    @_dice.push new @Die @args.faces for [1..@args.num]

    this

  get_total: (arg) ->
    @roll arg if arg
    return unless @_is_good()
    @get_mod() + @_get_unmod_total()

  _is_good: -> true if @args and @args.faces and @args.num > 0

  @_good: ->
    (f) ->
      ->
        f.apply(this, arguments) if @_is_good()

  _get_unmod_max: @_good() -> parseInt @args.num * @args.faces, 10

  _get_unmod_min: @_good() -> parseInt @args.num * 1, 10

  get_min: @_good() -> @_get_unmod_min() + @get_mod()

  get_max: @_good() -> @_get_unmod_max() + @get_mod()

  is_min: @_good() -> @_get_unmod_total() is @_get_unmod_min()

  is_max: @_good() -> @_get_unmod_total() is @_get_unmod_max()

  _get_unmod_total: @_good() -> @get_scores().reduce (x,y) -> x + y

  get_scores: @_good() -> parseInt(d.score,10) for d in @_dice

  get_mod: @_good() -> parseInt(@args.mod,10)

