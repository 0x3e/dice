class (exports ? this).DicesView
  constructor: (@dice,@log) -> return

  update: () -> return

  roll: () ->
    @dice.roll()
    @log(@dice)
    @update()

