
function floatingPointRounding(float, places){

    var shift = Math.pow(10, places + 1);

    Number.toFixed(float * shift)




}