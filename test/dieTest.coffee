expect = require('chai').expect
Die    = require('die').Die
describe 'Die', ->
  d = null
  it 'should have faces ', ->
    d = new Die 4
    expect(d.faces).to.equal 4
  it 'should have a suitable score ', ->
    d = new Die 2
    expect(d.score).to.be.above 0
    expect(d.score).to.be.within(1,2)
    expect(d.score).to.be.below 3
