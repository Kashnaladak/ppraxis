
function isSquare(a,b,c,d){
    function calcDist(x,y){
        return Math.pow(x[0] - y[0], 2) + Math.pow(x[1] - y[1], 2);
    }

    var obj = {};
    function collect(val){
        obj[val] = obj[val] ? ++obj[val] : 1;
    }

    collect(calcDist(a,b));
    collect(calcDist(a,c));
    collect(calcDist(a,d));
    collect(calcDist(b,c));
    collect(calcDist(b,d));
    collect(calcDist(c,d));

    var keys = Object.keys(obj);
    return keys.length == 2 && Math.abs(obj[keys[0]]-obj[keys[1]]) == 2;
}

//True
isSquare([0,0], [0,1], [1,1], [1,0]);
isSquare([0,0], [2,1], [3,-1], [1, -2]);
isSquare([0,0], [1,1], [0,1], [1,0]);

//False
isSquare([0,0], [0,2], [3,2], [3,0]);
isSquare([0,0], [3,4], [8,4], [5,0]);
isSquare([0,0], [0,0], [1,1], [0,0]);
isSquare([0,0], [0,0], [1,0], [0,1]);
isSquare([0,0], [0,0], [0,0], [0,1]);
