/*
 Asteroid Game
 Peter Nguyen
 Last Modified: 10/03/16

 Inputs:
 Outputs:

 Notes:

 ------------------------------------------------------------------------------------------
 ------------------------------------------------------------------------------------------
 */
var ship;

function closeAsteroidGame() {
    asteroidGameArea.stop();
    $('#asteroidModal').modal('hide');
}

function openAsteroidGame() {
    startAsteroidGame();
}

function resetAsteroidGame() {
    asteroidGameArea.stop();
    ship.bullets = [];
    asteroidGameArea.start();
    document.getElementById("asteroidModal").focus();
}

function setupAsteroidGame() {}

function startAsteroidGame() {
    ship = new mainShip (50, 50, 20, 20);
    asteroidGameArea.start();
}

var asteroidGameArea = {
    canvas: document.createElement("canvas"),
    start: function () {
        this.canvas = document.getElementById("asteroidCanvas");
        this.context = this.canvas.getContext("2d");
        this.frameNo = 0;
        this.interval = setInterval(updateAsteroidGameArea, 20);

        // Key Inputs
        window.addEventListener('keydown', function (e) {
            e.preventDefault();
            asteroidGameArea.keys = (asteroidGameArea.keys || []);
            asteroidGameArea.keys[e.keyCode] = (e.type == "keydown");
        })
        window.addEventListener('keyup', function (e) {
            asteroidGameArea.keys[e.keyCode] = (e.type == 'keydown');
        })
    },
    stop: function () {
        clearInterval(this.interval);
    },
    clear: function () {
        this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
    }
}

function mainShip(x, y, width, height, type) {
    this.type = type;
    this.x = x;
    this.y = y;
    this.nx;
    this.ny;
    this.width = width;
    this.height = height;
    this.speed = 0;
    this.angle = 0;
    this.moveAngle = 0;
    this.bullets = [];
    this.lockedShooting = false;
    this.drawShip = function () {
        var ctx = asteroidGameArea.context;

        ctx.save();
        ctx.translate(this.x, this.y);
        ctx.rotate(this.angle);

        // Ship Design
        ctx.beginPath()
        ctx.moveTo(10, 0);
        ctx.lineTo(0, 20);
        ctx.lineTo(10, 15);
        ctx.lineTo(20, 20);
        ctx.closePath();
        ctx.stroke();

        ctx.restore();
    };
    this.keyInputs = function () {
        if (asteroidGameArea.keys && (asteroidGameArea.keys[37] || asteroidGameArea.keys[65])) {
            ship.moveAngle = -5;
        }
        if (asteroidGameArea.keys && (asteroidGameArea.keys[39] || asteroidGameArea.keys[68])) {
            ship.moveAngle = 5;
        }
        if (asteroidGameArea.keys && (asteroidGameArea.keys[38] || asteroidGameArea.keys[87])) {
            ship.speed = 5;
        }
        if (asteroidGameArea.keys && (asteroidGameArea.keys[40] || asteroidGameArea.keys[83])) {
            ship.speed = -5;
        }
        if (asteroidGameArea.keys && asteroidGameArea.keys[32]) {
            if (!ship.lockedShooting) {
                ship.lockedShooting = true;
                setTimeout(ship.unlockShooting, 500);
                ship.shoot();
            }
        }
    };
    this.unlockShooting = function () {
        ship.lockedShooting = false;
    };
    this.moveShip = function () {
        this.angle += this.moveAngle * Math.PI / 180;
        this.x += this.speed * Math.sin(this.angle);
        this.y -= this.speed * Math.cos(this.angle);

        var ws = wrapScreen(this.x, this.y, this.width, this.height);
        this.x = ws[0];
        this.y = ws[1];
    };
    this.shoot = function () {
        this.bullets.push(new bullet(this.x, this.y, this.angle, 1));
    };
    this.removeBullet = function () {
        for (i = 0; i < this.bullets.length; i++) {
            if (0 > this.bullets[i].x || this.bullets[i].x > asteroidGameArea.canvas.width) {
                this.bullets.splice(i, 1);
            } else if (0 > this.bullets[i].y || this.bullets[i].y > asteroidGameArea.canvas.height) {
                this.bullets.splice(i, 1);
            }
        }
    }
}

function bullet(x, y, angle, speed, type) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.angle = angle;
    this.drawBullet = function () {
        var ctx = asteroidGameArea.context;
        ctx.save();
        ctx.translate(this.x, this.y);
        ctx.rotate(this.angle);
        ctx.beginPath();
        ctx.moveTo(10, 0);
        ctx.lineTo(10, -5);
        ctx.closePath();
        ctx.stroke();
        ctx.restore();
    };
    this.moveBullet = function () {
        this.x += this.speed * Math.sin(this.angle);
        this.y -= this.speed * Math.cos(this.angle);
    }
}

function updateAsteroidGameArea() {
    asteroidGameArea.clear();
    ship.moveAngle = 0;
    ship.speed = 0;
    ship.keyInputs();
    ship.moveShip();
    ship.drawShip();
    for (i = 0; i < ship.bullets.length; i++) {
        ship.bullets[i].drawBullet();
        ship.bullets[i].moveBullet();
    }
    ship.removeBullet();
}

function wrapScreen(x, y, w, h) {
    var newCordinates = [x, y];
    if (x + w < 0) {
        newCordinates[0] = asteroidGameArea.canvas.width;
    } else if (x - w > asteroidGameArea.canvas.width) {
        newCordinates[0] = 0;
    }

    if (y + h < 0) {
        newCordinates[1] = asteroidGameArea.canvas.height;
    } else if (y - h > asteroidGameArea.canvas.height) {
        newCordinates[1] = 0;
    }
    return newCordinates;
}