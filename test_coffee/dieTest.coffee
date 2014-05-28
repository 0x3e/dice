window? or (
  require('blanket')
  expect = require('chai').expect
  Die    = require('die').Die
)
describe 'Die', ->
  d = null
  it 'should have faces', ->
    d = new Die 4
    expect(d.get_faces()).to.equal 4
    d = new Die
    expect(d.roll()).to.equal undefined
  it 'should have a suitable score ', ->
    d = new Die 2
    expect(d.get_score()).to.be.above 0
    expect(d.get_score()).to.be.within 1,2
    expect(d.get_score()).to.be.below 3
    expect(d.roll()).to.be.above 0
    expect(d.roll()).to.be.within 1,2
    expect(d.roll()).to.be.below 3
