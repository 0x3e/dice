class (exports ? this).Dice
  Die: Die? and Die
  constructor: (@arg) ->
    @die = Dice::Die? and Dice::Die or @die = Die
    @args = {}
    @roll() if @arg

  parse_arg: (arg) ->
    @arg = arg if arg
    return unless @arg
    arg = @arg.match(/(\d*)d(\d+)(.*)/)
    @args.num = arg[1] || 1
    @args.faces = parseInt(arg[2],10) || 0
    @args.mod = arg[3] || 0
    @args

  roll: (arg) ->
    @dice = []
    args = @parse_arg arg unless arg == @arg
    return unless @args.num
    @dice.push new @die @args.faces for [1..@args.num]
    return this

  is_min: ->
    @get_unmod_total() == @args.num * 1

  is_max: ->
    @get_unmod_total() == @args.num * @args.faces

  get_total: (arg) ->
    @roll arg if arg
    return unless @dice.length
    @get_mod() + @get_unmod_total()

  get_unmod_total: -> @get_scores().reduce (x,y) -> x + y

  get_scores: -> @dice.map (d) ->  parseInt d.score

  get_mod: ->  parseInt(@args.mod,10)
