class (exports ? this).View
  constructor: (@view_container) -> return

  div: (ob) ->
    ob.element = 'div'
    @el ob

  span: (ob) ->
    ob.el = 'span'
    @el ob

  form: (ob) ->
    ob.element = 'form'
    @el ob

  input: (ob) ->
    ob.element = 'input'
    el = @el ob
    el.type = ob.type if ob.type
    el

  el: (ob) ->
    el = document.createElement(ob.element)
    el.id = ob.id if ob.id
    el.className = ob.class  if ob.class
    el.className += ob.classes  if ob.classes
    el.innerHTML = ob.innerHTML  if ob.innerHTML
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
    el.parentElement.removeChild(el)
    return
