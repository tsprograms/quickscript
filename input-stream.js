/*
This file creates a simple input stream interface, exported to the root context as InputStream (or as module.exports).
Created on 6/3/16 by TSPrograms.
Copyright © 2016 TSPrograms.
*/


(function() {
  var InputStream = function(input) {
    if (typeof input !== 'string') {
      throw 'Input to InputStream must be of type string!';
    }
    var pos = 0, line = 1, col = 0;
    this.next = function() {
        var char = input.charAt(pos++);
        if (char === "\n") {
          ++line, col = 0;
        }
        else {
          ++col;
        }
        return char;
    };
    this.peek = function() {
        return input.charAt(pos);
    };
    this.eof = function() {
        return peek() === "";
    };
    this.croak = function(msg) {
        throw new Error(msg + " (" + line + ":" + col + ")");
    }
  };
  var root = this; // Get the root context via this in an anonymous function
  root.InputStream = InputStream;
  if (typeof module !== 'undefined' && module.exports) {
    module.exports = InputStream; // Export to module.exports if module.exports exists
  }
});
