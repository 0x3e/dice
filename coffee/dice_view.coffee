class (exports ? this).DiceView
  constructor: (@id, @parent, @up_e, @dice) ->
    @up = new View(@up_e)
    @con = @up.div
      id: "dice#{@id}"
      className: 'dice'
      parent: @up_e
    @view = new View(@con)
    @roll_a = @view.a
      innerHTML: 'roll'
      className: 'dice_roll'
      parent: @con
    @roll_a.href = 'javascript:void(0)'
    @roll_a.onclick = =>
      @roll()
      false
    @delete_a = @view.a
      innerHTML: 'delete'
      className: 'dice_delete'
      parent: @con
    @delete_a.href = 'javascript:void(0)'
    @delete_a.onclick = =>
      @destructor()
      false
    @label = @view.div
      innerHTML: @dice.arg
      className: 'dice_label'
      parent: @con
    @out = @view.div
      className: 'dice_out'
      parent: @con
    @update()

  update: () ->
    tot = @dice.get_total()
    @view.empty @out
    _out = @view.div
      innerHTML: @dice.get_total()
      parent: @out
    _out.className += 'max' if @dice.is_max()
    _out.className += 'min' if @dice.is_min()

  roll: () ->
    @dice.roll()
    @update()

  destructor: () ->
    @dice = null
    @view.remove @con
    @parent.remove_dice this

