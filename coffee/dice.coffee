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
    @dice = []
    @args = @_parse_arg arg
    return this unless @args
    @dice.push new @Die @args.faces for [1..@args.num]

    this

  good_args: -> true if @args and @args.faces and @args.num > 0

  get_unmod_max: ->
    parseInt(@args.num * @args.faces, 10) if @good_args()

  get_unmod_min: ->
    parseInt(@args.num * 1, 10 if @good_args()) if @good_args()

  get_min: -> @get_unmod_min() + @get_mod() if @good_args()

  get_max: -> @get_unmod_max() + @get_mod() if @good_args()

  is_min: -> @_get_unmod_total() is @get_unmod_min() if @good_args()

  is_max: -> @_get_unmod_total() is @get_unmod_max() if @good_args()

  get_total: (arg) ->
    @roll arg if arg
    return unless @good_args()
    @get_mod() + @_get_unmod_total()

  _get_unmod_total: ->
    (@get_scores().reduce (x,y) -> x + y) if @good_args()

  get_scores: -> (parseInt(d.score,10) for d in @dice) if @good_args()

  get_mod: -> parseInt(@args.mod,10)

