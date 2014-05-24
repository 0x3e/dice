window? or (
  require('blanket')
  expect         = require('chai').expect
  Probability    = require('probability').Probability
)
describe 'Probability', ->
  p = null
  it 'should have a table', ->
    p = new Probability [[1, '1'],[1,'2']]
    expect(p.table.length).to.equal 2
  it 'should have entries', ->
    p = new Probability [[1, '1'],[1,'2']]
    expect(p.get_string 1 ).to.equal '1'
    expect(p.get_string 2 ).to.equal '2'
  it 'should have entries as multi', ->
    p = new Probability [[2, 'one'],[3,'two']]
    expect(p.get_string 0 ).to.equal ''
    expect(p.get_string 1 ).to.equal 'one'
    expect(p.get_string 2 ).to.equal 'one'
    expect(p.get_string 3 ).to.equal 'two'
    expect(p.get_string 4 ).to.equal 'two'
    expect(p.get_string 5 ).to.equal 'two'
    expect(p.get_string 6 ).to.equal ''
  it 'should have entries as links', ->
    p1 = new Probability [[3,'one'],[4,'two']]
    p2 = new Probability [[2,'three'],[3,'four']]
    p3 = new Probability [[1,'p1',p1],[1,'p2',p2]]
    expect(p3.get().length).to.equal 2
  it 'should have entries as deep links', ->
    p1 = new Probability [[3,'one'],[4,'two']]
    p2 = new Probability [[2,'three'],[3,'four']]
    p3 = new Probability [[1,'p1',p1],[1,'p2',p2]]
    p4 = new Probability [[1,2,p3],[1,4,p2]]
    for [1..100]
      expect(p4.get()).to.exist
  it 'should have additional entries', ->
    p1 = new Probability [[3,'one'],[4,'two']]
    p1.add_section [3,'three',p1]
    for [1..100]
      expect(p1.get()).to.exist
