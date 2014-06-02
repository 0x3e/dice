class (exports ? this).DicesView
  constructor: (@id,@up_e,@dice) ->
    @views = []
    @in_vals = []
    @up = new View(@up_e)
    @con = @up.new
      element: 'div'
      id: "dices#{id}"
      className: 'dices'
    @view = new View(@con)
    @form = @view.new
      element: 'form'
      className: 'dices_form'
    @in = @view.new
      element: 'input'
      className: 'dices_in'
      parent: @form
    @sub = @view.new
      element: 'input'
      className: 'dices_sub'
      type: 'submit'
      parent: @form
    @sub.value = 'Create Dice'
    @out = @view.new
      element: 'div'
      id: 'dice'
    @sub.onclick = =>
      @add_dice()
      false
    if Store.get "dices#{@id}"
      @add_dice i for i in JSON.parse(Store.get "dices#{@id}")

  add_dice: (in_v) ->
    in_v = @in.value unless in_v
    dice = new @dice(in_v)
    if dice.is_good()
      @views.push new DiceView(@views.length,this ,@out, dice)
      @in_vals.push in_v
      Store.set "dices#{@id}",JSON.stringify(@in_vals.filter (i)-> i if i)

  remove_dice: (dice_view) ->
    @views[dice_view.id] = undefined
    @in_vals[dice_view.id] = undefined
    Store.set "dices#{@id}",JSON.stringify(@in_vals.filter (i)-> i if i)
    dice_view = undefined

