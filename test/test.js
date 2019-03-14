// test/test.js
var expect = require('chai').expect;
var add = require('../add');

describe('add()', () => {
  it('should add two numbers', () => {
    var x = Math.random();
    var y = Math.random();

    var sum = add(x, y);

    expect(sum).to.be.equal(x + y);
  });
});
