window? or (
  require('blanket')
  expect = require('chai').expect
  DiceView    = require('dice_view').DiceView
  DiceView::View = require('view').View
  class Node
    constructor: ->
      @children = []
      @firstChild = false

    appendChild: (el) ->
      @parentElement = @parent
      @children.push el
      @firstChild = true

    removeChild: (el) ->
      @children = []
      @firstChild = false

    createElement: -> new Node()

  global.document = new Node()
)
describe 'DiceView', ->
  dv = null
  id = 1
  p = document.createElement('div')
  p.remove_dice = -> false
  dice = {}
  dice.arg = '1d6'
  dice.get_total = -> '3'
  dice.is_max = -> false
  dice.is_min = -> false
  dice.roll = -> {}
  up_e = document.createElement('div')
  it 'should have some output', ->
    dv = new DiceView id, p, up_e, dice
    expect(dv.out.children[0].innerHTML).to.equal dice.get_total()
  it 'should have some max roll', ->
    dice.get_total = -> '6'
    dice.is_max = -> true
    dice.is_min = -> false
    expect(dv.roll_a.onclick()).to.equal false
    expect(dv.out.children[0].innerHTML).to.equal dice.get_total()
    expect(dv.out.children[0].className).to.equal 'max'
  it 'should have some min roll', ->
    dice.get_total = -> '1'
    dice.is_max = -> false
    dice.is_min = -> true
    expect(dv.roll_a.onclick()).to.equal false
    expect(dv.out.children[0].innerHTML).to.equal dice.get_total()
    expect(dv.out.children[0].className).to.equal 'min'
  it 'should have some delete', ->
    expect(dv.delete_a.onclick()).to.equal false
