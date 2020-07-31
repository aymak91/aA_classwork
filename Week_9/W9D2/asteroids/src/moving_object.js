const MovingObject = function (obj) {
    this.pos = obj[pos];
    this.vel = obj[vel];
    this.radius = obj[radius];
    this.color = obj[color];
}

MovingObject.prototype.draw = function (ctx) {
    ctx.beginPath();
    ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
    ctx.strokeStyle = "green";
    ctx.lineWidth = 20;
    ctx.stroke();
    ctx.fillStyle = "white";
    ctx.fill();
}



module.exports = MovingObject;