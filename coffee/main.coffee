class (exports ? this).Main
  constructor: ->
    window.onload = ->
      dice = new Dice()
      view = new View(document.body)
      dice_div = view.div({id: 'dice1'})
      dice_view = new DiceView(dice_div,dice)
      return
    return

