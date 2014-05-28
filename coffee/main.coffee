class (exports ? this).Main
  constructor: ->
    window.onload = =>
      dice = Dice
      @view = new View(document.body)
      dices_div = view.div({id: 'dices'})
      @dices_view = new DicesView(0,dices_div,dice)
      return
    return

