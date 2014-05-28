class (exports ? this).DicesView
  constructor: (id,@up_e,@dice) ->
    @views = []
    @up = new View(@up_e)
    @con = @up.div
      id: "dices#{id}"
      className: 'dices'
    @view = new View(@con)
    @form = @view.form className: 'dices_form'
    @in = @view.input className: 'dices_in', parent: @form
    @sub = @view.input
      className: 'dices_sub'
      type: 'submit'
      parent: @form
    @sub.value = 'Create Dice'
    @out = @view.div id: 'dice'
    @sub.onclick = =>
      @add_dice()
      false

  add_dice: ->
    dice = new @dice(@in.value)
    if dice.is_good()
      @views.push new DiceView(@views.length,this ,@out, dice)
  remove_dice: (dice_view) ->
    @views[dice_view.id] = undefined
    dice_view = undefined

