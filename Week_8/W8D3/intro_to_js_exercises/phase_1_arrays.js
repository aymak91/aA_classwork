Array.prototype.uniq = function() {
  let sortedArray = [];
  
  for (let i = 0; i < this.length; i++) {
    if (!sortedArray.includes(this[i])) {
      sortedArray.push(this[i]);
    }
  }
  return sortedArray;
}

Array.prototype.twoSum = function() {
  let sumsArray = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if ((this[i] + this[j]) === 0) {
        sumsArray.push([i, j]);
      }
    }
  }
  return sumsArray;
}


// Helper for transpose
function makeArray(n) {
  let newArray = new Array(n);
  for(let i = 0; i < newArray.length; i++) {
    newArray[i] = new Array();
  }
  return newArray;
}

Array.prototype.transpose = function() {
    let newArray = makeArray(this.length);
    
    for(let i = 0; i < this.length; i++) {
        for(let j = 0; j < this[i].length; j++) {
            newArray[j][i] = this[i][j];
        }
    }
    return newArray;
}
// console.log(  [  [1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]  ].transpose())

