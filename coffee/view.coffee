class (exports ? this).View
  document: document? and document
  constructor: (@view_container) ->
    @document = View::document? and View::document or @document = document

  new: (ob) ->
    el = @document.createElement(ob.element)
    el[k] = v for own k,v of ob unless k is 'parent'
    if ob.parent
      ob.parent.appendChild el
    else
      @view_container.appendChild el
    el

  remove: (el) ->
    @empty el
    el.parentElement.removeChild el
    return
  empty: (el) ->
    while el.firstChild
      el.removeChild el.firstChild
    return

