window? or (
  require('blanket')
  expect = require('chai').expect
  Dice   = require('dice').Dice
  Dice.prototype.Die = require('die').Die
)

describe 'Dice', ->
  d = null
  it 'total show undefined without dice 1', ->
    d = new Dice()
    expect(d.get_total()).to.be.undefined
  it 'total show undefined without dice 2', ->
    expect(d.get_max()).to.be.undefined
  it 'total show undefined without dice 3', ->
    expect(d.get_min()).to.be.undefined
  it 'total show undefined without dice 4', ->
    expect(d.is_max()).to.be.undefined
  it 'total show undefined without dice 5', ->
    expect(d.is_min()).to.be.undefined
  it 'should deal with good input 1', ->
    expect(d.roll('d2').get_total()).to.be.within 1,2
  it 'should deal with good input 2', ->
    expect(d.roll('1 d 2').get_total()).to.be.within 1,2
  it 'should deal with good input 2', ->
    expect(d.roll('1 d 2 +1').get_total()).to.be.within 2,3
  it 'should deal with good input 3', ->
    expect(d.roll('1 d 2 + 1').get_total()).to.be.within 2,3
  it 'should deal with good input 4', ->
    expect(d.roll('   1   d   2   +   1   ').get_total()).to.be.within 2,3
  it 'should deal with bad input 1', ->
    d = new Dice()
    expect(d.roll(1).get_total()).to.be.undefined
  it 'should deal with bad input 2', ->
    expect(d.roll('1').get_total()).to.be.undefined
  it 'should deal with bad input 3', ->
    expect(d.roll('g').get_total()).to.be.undefined
  it 'should deal with bad input 4', ->
    expect(d.roll('0').get_total()).to.be.undefined
  it 'should deal with bad input 5', ->
    expect(d.roll('d0').get_total()).to.be.undefined
  it 'should deal with bad input 6', ->
    expect(d.roll('0d0').get_total()).to.be.undefined
  it 'should deal with bad input 7', ->
    expect(d.roll('2d0').get_total()).to.be.undefined
  it 'should deal with bad input 8', ->
    expect(d.roll('0d8').get_total()).to.be.undefined
  it 'should have a correct max 1', ->
    d = new Dice('10d2')
    expect(d.get_max()).to.equal 20
  it 'should have a correct max 2', ->
    d = new Dice('10d2+10')
    expect(d.get_max()).to.equal 30
  it 'should have a correct min', ->
    d = new Dice('10d2')
    expect(d.get_min()).to.equal 10
    d = new Dice('10d2-10')
    expect(d.get_min()).to.equal 0
    d = new Dice('10d2+10')
    expect(d.get_min()).to.equal 20
  it 'should have a suitable score ', ->
    d = new Dice('1d2')
    for i in [1..10]
      d.roll()
      expect(d.get_total()).to.be.above 0
      expect(d.get_total()).to.be.within 1, 2
      expect(d.get_total()).to.be.below 3
      if d.get_total() == 2
        expect(d.is_max()).to.be.true
      else
        expect(d.is_max()).to.be.false
      if d.get_total() == 1
        expect(d.is_min()).to.be.true
      else
        expect(d.is_min()).to.be.false
    for i in [1..10]
      d.roll('d' + i)
      expect(d.get_total()).to.be.above 0
      expect(d.get_total()).to.be.within 1, i
      expect(d.get_total()).to.be.below i + 1
      if d.get_total() == i
        expect(d.is_max()).to.be.true
      else
        expect(d.is_max()).to.be.false
      if d.get_total() == 1
        expect(d.is_min()).to.be.true
      else
        expect(d.is_min()).to.be.false
    for i in [1..10]
      d.roll(i + 'd6')
      expect(d.get_total()).to.be.above 0
      expect(d.get_total()).to.be.within 1, i * 6
      expect(d.get_total()).to.be.below i * 6 + 1
      if d.get_total() == i * 6
        expect(d.is_max()).to.be.true
      else
        expect(d.is_max()).to.be.false
      if d.get_total() == i * 1
        expect(d.is_min()).to.be.true
      else
        expect(d.is_min()).to.be.false
    for i in [1..10]
      d.roll('3d6+' + i)
      expect(d.get_total()).to.be.above 2 + i
      expect(d.get_total()).to.be.within 3 + i, 18 + i
      expect(d.get_total()).to.be.below 25 + i
      if d.get_total() == 18 + i
        expect(d.is_max()).to.be.true
      else
        expect(d.is_max()).to.be.false
      if d.get_total() == 3 + i
        expect(d.is_min()).to.be.true
      else
        expect(d.is_min()).to.be.false
    for i in [1..10]
      d.roll('3d6+6')
      expect(d.get_total()).to.be.above 3 + 5
      expect(d.get_total()).to.be.within 3 + 6, 3 * 6 + 6
      expect(d.get_total()).to.be.below 3 * 6 + 7
      if d.get_total() == 24
        expect(d.is_max()).to.be.true
      else
        expect(d.is_max()).to.be.false
      if d.get_total() == 9
        expect(d.is_min()).to.be.true
      else
        expect(d.is_min()).to.be.false
    for i in [1..10]
      expect(d.get_total('30d2+5')
      ).to.be.within d.get_min(), d.get_max()
