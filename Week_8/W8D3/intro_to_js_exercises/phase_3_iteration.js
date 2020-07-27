arr = [5, 8, 2, 1, 7, 9, 4, 3, 6]

Array.prototype.bubbleSort = function () {
    let sorted = false;

    while (!sorted) {
        sorted = true;
        for(let i = 0; i < this.length - 1; i++) {
          if (this[i] > this[i+1]) {
              [this[i], this[i + 1]] = [this[i + 1], this[i]];
              sorted = false;
            }
        }
    }
    return this
}

// ( ^_^)=b
console.log(arr.bubbleSort());
