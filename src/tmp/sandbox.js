// Generated by CoffeeScript 1.4.0
(function() {
  var root;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  root.mylog = function(x) {
    return Math.log(x) / Math.LN2;
  };

  root.mylog2 = function(x) {
    var count;
    count = 0;
    while (x > 1) {
      x >>= 1;
      count++;
    }
    return count;
  };

}).call(this);
