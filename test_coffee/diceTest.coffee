require("blanket")
expect = require('chai').expect
Dice   = require('dice').Dice
Dice.prototype.Die = require('die').Die
describe 'Dice', ->
  d = null
  it 'should have at least one die', ->
    d = new Dice('1d2')
    expect(d.dice[0].faces).to.equal 2
  it 'should show undefined without dice', ->
    d = new Dice()
    expect(d.roll()).to.be.undefined
    expect(d.get_total()).to.be.undefined
  it 'should have a suitable score ', ->
    d = new Dice('1d2')
    for i in [1..10]
      d.roll()
      expect(d.get_total()).to.be.above 0
      expect(d.get_total()).to.be.within(1,2)
      expect(d.get_total()).to.be.below 3
      if d.get_total() == 2
        expect(d.max).to.be.true
      else
        expect(d.max).to.be.false
      if d.get_total() == 1
        expect(d.min).to.be.true
      else
        expect(d.min).to.be.false
    for i in [1..10]
      d.roll('d'+i)
      expect(d.get_total()).to.be.above 0
      expect(d.get_total()).to.be.within(1,i)
      expect(d.get_total()).to.be.below i+1
      if d.get_total() == i
        expect(d.max).to.be.true
      else
        expect(d.max).to.be.false
      if d.get_total() == 1
        expect(d.min).to.be.true
      else
        expect(d.min).to.be.false
    for i in [1..10]
      d.roll(i+'d6')
      expect(d.get_total()).to.be.above 0
      expect(d.get_total()).to.be.within(1,i*6)
      expect(d.get_total()).to.be.below i*6+1
      if d.get_total() == i*6
        expect(d.max).to.be.true
      else
        expect(d.max).to.be.false
      if d.get_total() == i*1
        expect(d.min).to.be.true
      else
        expect(d.min).to.be.false
