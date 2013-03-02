root = exports ? this

root.mylog = (x) ->
  Math.log(x) / Math.LN2

root.mylog2 = (x) ->
  count = 0
  while x > 1
    x >>= 1
    count++
  count