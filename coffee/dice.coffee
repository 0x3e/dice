class (exports ? this).Dice
  Die: Die? and Die
  constructor: (@arg) ->
    @die = Dice::Die? and Dice::Die or @die = Die
    @args = {}
    @roll() if @arg

  _parse_arg: (arg) ->
    @arg = arg if arg
    arg = @arg.match(/(\d*)d(\d+)(.*)/)
    @args.num = arg[1] or 1
    @args.faces = parseInt(arg[2],10) or 0
    @args.mod = arg[3] or 0

    @args

  roll: (arg) ->
    @dice = []
    args = @_parse_arg arg unless arg is @arg
    return unless @args.num
    @dice.push new @die @args.faces for [1..@args.num]

    this

  is_min: ->
    @get_unmod_total() is @get_unmod_min()

  is_max: ->
    @get_unmod_total() is @get_unmod_max()

  get_unmod_max: -> parseInt @args.num * @args.faces, 10

  get_unmod_min: -> parseInt @args.num * 1, 10

  get_max: -> @get_unmod_max() + @get_mod()

  get_min: -> @get_unmod_min() + @get_mod()

  get_total: (arg) ->
    @roll arg if arg
    return unless @dice.length

    @get_mod() + @get_unmod_total()

  get_unmod_total: -> @get_scores().reduce (x,y) -> x + y

  get_scores: -> parseInt(d.score,10) for d in @dice

  get_mod: ->  parseInt(@args.mod,10)
