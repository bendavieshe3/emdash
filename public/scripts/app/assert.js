/*
 * Assertion functions
 */

(function() {

  var assert = function(value, msg) {
    if( !value ) 
      throw( msg || value + " does not equal true");
  }

  var assertEqual = function(val1, val2, msg) {
    if(val1 !== val2)
      throw (msg || val1 + " does not equal " + val2)
  }


  window.assert = assert;
  window.assertEqual = assertEqual;


}).call();
