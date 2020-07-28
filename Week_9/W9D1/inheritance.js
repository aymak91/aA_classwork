Function.prototype.inherits = function(parentClass) {
    //1
    function Surrogate () {}
    //2
    Surrogate.prototype =  parentClass.prototype;
    //3
    this.prototype = new Surrogate();
    //4
    this.prototype.constructor = this;
    
}

function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);