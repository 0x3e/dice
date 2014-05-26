
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
    return this unless @good_args()
    @dice.push new @Die @args.faces for [1..@args.num]

    this

  get_total: (arg) ->
    @roll arg if arg
    return unless @good_args()
    @get_mod() + @_get_unmod_total()

  good_args: -> true if @args and @args.faces and @args.num > 0

  @if_args: ->
    (f) ->
      ->
        f.apply(this, arguments) if @good_args()

  get_unmod_max: @if_args() -> parseInt @args.num * @args.faces, 10

  get_unmod_min: @if_args() -> parseInt @args.num * 1, 10

  get_min: @if_args() -> @get_unmod_min() + @get_mod()

  get_max: @if_args() -> @get_unmod_max() + @get_mod()

  is_min: @if_args() -> @_get_unmod_total() is @get_unmod_min()

  is_max: @if_args() -> @_get_unmod_total() is @get_unmod_max()

  _get_unmod_total: @if_args() -> @get_scores().reduce (x,y) -> x + y

  get_scores: @if_args() -> parseInt(d.score,10) for d in @dice

  get_mod: @if_args() -> parseInt(@args.mod,10)

