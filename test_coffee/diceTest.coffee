expect = require('chai').expect
global.Die = require('die').Die
global.Dice   = require('dice').Dice
describe 'Dice', ->
  d = null
  it 'should have at least one die', ->
    d = new Dice('1d2')
    expect(d.dice[0].faces).to.equal 2
  it 'should have a suitable score ', ->
    d = new Dice('1d2')
    expect(d.dice[0].score).to.be.above 0
    expect(d.dice[0].score).to.be.within(1,2)
    expect(d.dice[0].score).to.be.below 3
