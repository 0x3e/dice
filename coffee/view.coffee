class (exports ? this).View
  constructor: (@view_container) -> return

  div: (ob) ->
    ob.element = 'div'
    @el ob

  span: (ob) ->
    ob.element = 'span'
    @el ob

  a: (ob) ->
    ob.element = 'a'
    @el ob

  form: (ob) ->
    ob.element = 'form'
    @el ob

  input: (ob) ->
    ob.element = 'input'
    el = @el ob

  el: (ob) ->
    el = document.createElement(ob.element)
    el[k] = v for own k,v of ob unless k is parent
    if ob.parent
      ob.parent.appendChild el
    else
      @view_container.appendChild el
    el

  hide: ->
    @view_container.style.display = 'none'
    return

  show: ->
    @view_container.style.display = 'block'
    return

  remove: (el) ->
    @empty el
    el.parentElement.removeChild el
    return
  empty: (el) ->
    while el.firstChild
      el.removeChild el.firstChild

