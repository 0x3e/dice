expect = require('chai').expect
Dice   = require('dice').Dice
Dice.Die = require('die').Die
describe 'Dice', ->
  d = null
  it 'should have at least one die', ->
    console.log(Dice)
    d = new Dice('1d2')
    console.log(d)
    expect(d.dice[0].faces).to.equal 2
  it 'should show undefined without dice', ->
    d = new Dice()
    expect(d.roll()).to.be.undefined
    expect(d.get_total()).to.be.undefined
  it 'should have a suitable score ', ->
    d = new Dice('1d2')
    expect(d.dice[0].score).to.be.above 0
    expect(d.dice[0].score).to.be.within(1,2)
    expect(d.dice[0].score).to.be.below 3
    if d.get_total() == 2
      expect(d.max).to.be.true
    else
      expect(d.max).to.be.false
    for i in [1..10]
      d.roll()
      expect(d.dice[0].score).to.be.above 0
      expect(d.dice[0].score).to.be.within(1,2)
      expect(d.dice[0].score).to.be.below 3
      if d.get_total() == 2
        expect(d.max).to.be.true
      else
        expect(d.max).to.be.false
