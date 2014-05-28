class (exports ? this).DiceView
  constructor: (@parent,@dice) ->
    @view = new View(@parent)
    @form = @view.form id: 'dice_form'
    @in = @view.input id: 'dice_in', parent: @form
    @sub = @view.input
      id: 'dice_sub'
      type: 'submit'
      parent: @form
    @sub.onclick = =>
      @roll()
      false
    @out = @view.div id: 'dice_out', parent: @form

  update: () ->
    tot = @dice.get_total()
    if parseInt(tot, 10) == tot
      @view.div
        innerHTML: @dice.get_total()
        parent: @out
    return

  roll: () ->
    console.log(@in.value)
    @dice.roll(@in.value)
    console.log(@dice)
    @update()

