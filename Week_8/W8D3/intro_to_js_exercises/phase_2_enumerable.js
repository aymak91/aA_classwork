// cb
function proc(x) {
  return x * 2;
}

Array.prototype.myEach = function(cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
}

Array.prototype.myMap = function(cb) {
  let newArray = [];

  this.myEach(el => newArray.push(  cb(el)   ));

  return newArray;
}

Array.prototype.myReduce = function(cb, initialValue) {
    let newArray = this;

    if (initialValue === undefined) {
        initialValue = newArray[0];
        newArray = newArray.slice(1);
    }

    let result = initialValue;

    // newArray.myEach(   el => result = cb(result, el) );
  newArray.myEach(function(el)
    {result = cb(result, el)}
  );

  return result;
}


// console.log([1, 2, 3].myReduce(function(acc, ele) {return (acc + ele)}, 25));
// console.log([1, 2, 3].myReduce((acc, el) => (acc + el), 25)); // => 31)

