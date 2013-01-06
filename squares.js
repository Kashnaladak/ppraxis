
function isSquare(a,b,c,d){
    function calcDist(x,y){
        return Math.pow(x[0] - y[0], 2) + Math.pow(x[1] - y[1], 2);
    }

    var r = {};

    r[calcDist(a,b)] = 0;
    r[calcDist(a,c)] = 0;
    r[calcDist(a,d)] = 0;
    r[calcDist(b,c)] = 0;
    r[calcDist(b,d)] = 0;
    r[calcDist(c,d)] = 0;

    return Object.keys(r).length == 2;
}

isSquare([0,0], [0,1], [1,1], [1,0]);
isSquare([0,0], [2,1], [3,-1], [1, -2]);
isSquare([0,0], [1,1], [0,1], [1,0]);

isSquare([0,0], [0,2], [3,2], [3,0]);
isSquare([0,0], [3,4], [8,4], [5,0]);
isSquare([0,0], [0,0], [1,1], [0,0]);
isSquare([0,0], [0,0], [1,0], [0,1]);
