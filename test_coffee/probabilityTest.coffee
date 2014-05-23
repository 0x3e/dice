require('blanket')
expect         = require('chai').expect
Probability    = require('probability').Probability
describe 'Probability', ->
  p = null
  it 'should have a matrix', ->
    p = new Probability [[1, "1"],[1,"2"]]
    expect(p.matrix.length).to.equal 2
    expect(p.get(1)).to.equal "1"
    expect(p.get(2)).to.equal "2"
