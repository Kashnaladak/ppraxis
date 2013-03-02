###
  http://programmingpraxis.com/2013/01/18/triangle-trilemma/

  Today’s exercise is Problem A from the Google Code Jam Beta 2008. The problem is to accept three points as input,
  determine if they form a triangle, and, if they do, classify it as equilateral (all three sides the same),
  isoceles (two sides the same, the other different), or scalene (all three sides different), and also classify it as
  acute (all three angles less than 90 degrees), obtuse (one angle greater than 90 degrees) or right (one angle equal 90 degrees).
###
root = exports ? this


point = (x,y) ->
  x:x,
  y:y,
  same: (p) -> x == p.x and y == p.y

vector = (p1, p2) -> x: p2.x - p1.x, y: p2.y - p1.y



cartProd = (v1, v2) -> v1.x * v2.x + v1.y * v2.y

vecLength = (v) -> Math.sqrt(v.x*v.x + v.y*v.y)

calcAngle = (v1, v2) -> Math.round(Math.acos(cartProd(v1,v2) / (vecLength(v1) * vecLength(v2))).toFixed(2) * 180.00 / 3.14)




isSameAngle = (a1, a2) -> Math.abs(a1-a2) <= 1

isIsosceles = (a1, a2, a3) ->
  if(isSameAngle(a1, a2))
    if(a3 == 90)
      return "isosceles right"
    if(a3 < 90)
      return "isosceles acute"
    if(a3 > 90)
      return "isosceles obtuse"
  return false




classifyTriangle = (p1, p2, p3) ->
  v1 = vector(p1, p2)
  v2 = vector(p1, p3)
  v3 = vector(p2, p3)

  a1 = calcAngle(v1, v2)
  a2 = calcAngle(v2, v3)
  a3 = 180 - a1 - a2

  #is it a triangle
  if(a1 == 0 or a2 == 0 or a3 == 0)
    return "not a triangle"
  if(p1.same(p2) or p1.same(p3) or p2.same(p3))
    return "not a triangle"

  #is it equilateral
  if(a1 == 60 and a2 == 60)
    return "equilateral"

  #isosceles (2 angulos iguais)
  result = isIsosceles(a1,a2,a3) or isIsosceles(a1,a3,a2) or isIsosceles(a3,a2,a1)
  if(result)
    return result

  #scalene
  if(a1 > 90 or a2 > 90 or a3 > 90)
    return "scalene obtuse"
  if(a1 == 90 or a2 == 90 or a3 == 90)
    return "scalene right"
  return "scalene acute"


console.log classifyTriangle(point(0, 0), point(0, 4), point(1, 2))
console.log classifyTriangle(point(2, 2), point(2, 4), point(4, 3))
console.log classifyTriangle(point(5, 5), point(5, 6), point(6, 5))

console.log classifyTriangle(point(1, 1), point(1, 4), point(3, 2))
console.log classifyTriangle(point(3, 3), point(3, 4), point(5, 3))
console.log classifyTriangle(point(4, 4), point(4, 5), point(5, 6))

console.log classifyTriangle(point(6, 6), point(6, 7), point(6, 8))
console.log classifyTriangle(point(7, 7), point(7, 7), point(7, 7))