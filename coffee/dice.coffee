$0x3e = exports? and exports or @$0x3e = this
class $0x3e.Dice
  Die: Die? and Die
  constructor: (@arg) ->
    @die=Dice::Die? and Dice::Die or @die = Die
    @max = @min = false
    @args={}
    @dice=[]
    @roll() if @arg

  parse_arg: (arg) ->
    @arg = arg if arg
    return unless @arg
    arg=@arg.match(/(\d*)d(\d+)(.*)/)
    @args.num = arg[1]||1
    @args.faces = parseInt(arg[2],10)||0
    @args.mod = arg[3]||0
    @args

  roll: (arg) ->
    @dice=[]
    args=@parse_arg arg unless arg == @arg
    return unless @args.num
    for [1..@args.num]
      @dice.push new @die @args.faces
    @

  get_total: (arg) ->
    @roll arg if arg
    return unless @dice.length
    tot = 0
    tot += parseInt(d.score,10) for d in @dice
    @max = tot == @args.num * @args.faces
    @min = tot == @args.num * 1
    tot += parseInt(@args.mod)
    tot
