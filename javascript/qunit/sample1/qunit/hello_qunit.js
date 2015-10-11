var greeting = new Greeting();

QUnit.test( 'JavaScript QUnit Tests1', function( assert ) {
  assert.equal( greeting.hello('Miss'), 'Hello, Mike' );
  assert.equal( greeting.hello('Janet'), 'Hello, Janet' );
  assert.notEqual( greeting.hello('David'), 'Hi, David' );
});

QUnit.test( 'JavaScript QUnit Tests2', function( assert ) {
  assert.equal( greeting.hello('Miss'), 'Hello, Mike' );
  assert.equal( greeting.hello('Janet'), 'Hello, Janet' );
  assert.notEqual( greeting.hello('David'), 'Hi, David' );
});
