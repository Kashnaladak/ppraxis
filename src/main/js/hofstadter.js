
function hofstadter(n) {
    var r = 1, s = 2;
    var set = {1:1};

    for(var i = 1; i < n ; i++){
        r += s;
        set[r] = r;
        for(s++ ; set[s] ; s++);
    }

    return Object.keys(set);
}

hofstadter(10)