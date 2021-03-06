class (exports ? this).DiceView
  View: View? and View
  constructor: (@id, @parent, @up_e, @dice) ->
    @View = DiceView::View? and DiceView::View or @View = View
    @up = new @View(@up_e)
    @con = @up.new
      element: 'div'
      id: "dice#{@id}"
      className: 'dice'
      parent: @up_e
    @view = new @View(@con)
    @roll_a = @view.new
      element: 'a'
      innerHTML: 'roll'
      className: 'roll'
    @roll_a.href = 'javascript:void(0)'
    @roll_a.onclick = =>
      @roll()
      false
    @delete_a = @view.new
      element: 'a'
      innerHTML: 'delete'
      className: 'delete'
      parent: @con
    @delete_a.href = 'javascript:void(0)'
    @delete_a.onclick = =>
      @destructor()
      false
    @label = @view.new
      element: 'div'
      innerHTML: @dice.arg
      className: 'label'
      parent: @con
    @out = @view.new
      element: 'div'
      className: 'out'
      parent: @con
    @update()

  update: () ->
    tot = @dice.get_total()
    @view.empty @out
    _out = @view.new
      element: 'div'
      innerHTML: @dice.get_total()
      parent: @out
    @out.className += ' rolling'
    _out.className = 'max' if @dice.is_max()
    _out.className = 'min' if @dice.is_min()
    setTimeout(=>
      @out.className = @out.className.replace(' rolling','')
    , 500)
    return

  roll: () ->
    @dice.roll()
    @update()
    return

  destructor: () ->
    @dice = null
    @view.remove @con
    @parent.remove_dice this
    return

