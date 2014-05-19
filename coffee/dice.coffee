$0x3e = exports? and exports or @$0x3e = {}
class $0x3e.Dice
  constructor: (@arg) ->
    @args={}
    @roll() if @arg
    @

  parse_arg: (arg) ->
    @arg = arg if arg
    arg=@arg.match(/(\d*)d(\d+)(.*)/)
    @args.num = arg[1]||1
    @args.faces = parseInt(arg[2],10)||0
    @args.mod = arg[3]||0
    @args

  roll: (arg) ->
    @dice=[]
    args=@parse_arg arg
    for [1..args.num]
      @dice.push new Die args.faces
    @

  get_total: (arg) ->
    @roll arg if arg
    return unless @arg
    tot = parseInt(@args.mod)
    tot += parseInt(d.score,10) for d in @dice
    tot
