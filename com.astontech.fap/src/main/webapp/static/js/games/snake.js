/*
    Snake Game
    Peter Nguyen
    Last Modified: 10/03/16

    Inputs:
    Outputs:

    Notes:
    pos[x,y] : position of snake head at coordinates x,y
    top corner: 0,0
    max width: 550
    max height: 400

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
 */

// Global Variables
var xSnake;
var ySnake;
var rSnake;
var snakeBody = [];

var xApple;
var yApple;
var rApple;

// Boolean to determine game state
var run;

// String to determine snake move direction
var key = "RIGHT";

// Misc game variables
var gameSpeed;
var gameScore;
var applesEaten;
var keyPresses;
var time;
var newGame;

var canvas;
var ctx;
var id; // Used for starting and stopping game loop

function closeSnakeGame() {
    clearInterval(id);
    run = false;
    $('#snakeModal').modal('hide');

}

function openSnakeGame() {
    canvas = document.getElementById("snakeCanvas");
    ctx = canvas.getContext("2d");
    setupSnakeGame();
}

function setupSnakeGame() {
    xApple = Math.floor(Math.random()*545);
    yApple = Math.floor(Math.random()*395);
    xSnake = 275;
    ySnake = 200;

    // Setup Radius;
    rSnake = 10;
    rApple = 10;
    gameSpeed = 100;
    snakeBody = [[xSnake,ySnake]];

    gameScore = 0;
    applesEaten = 0;
    keyPresses = 1;
    newGame = false;
    run = false;

    drawSnake();
    drawApple();
}

// Get user's keyboard input
function keyInput() {
    var evt = window.event;

    if (run) {
        switch (evt.keyCode) {
            case 87:
            case 38:
                if (key != "DOWN") {
                    key = "UP";
                    keyPresses++;
                }
                break;
            case 83:
            case 40:
                if (key != "UP") {
                    key = "DOWN";
                    keyPresses++;
                }
                break;
            case 65:
            case 37:
                if (key != "RIGHT") {
                    key = "LEFT";
                    keyPresses++;
                }
                break;
            case 68:
            case 39:
                if (key != "LEFT") {
                    key = "RIGHT";
                    keyPresses++;
                }
                break;
            default:
                break;
        }
    }
    // Pause/Start game
    if(evt.keyCode == 32) {
        if(newGame) {
            resetSnakeGame();
        }
        if (run == true) {
            clearInterval(id);
            run = false;
        } else {
            id = setInterval(moveSnake, gameSpeed);
            run = true;
        }
    }
}

// Game loop
function moveSnake() {
    switch (key) {
        case "UP":
            ySnake-=rSnake;
            break;
        case "DOWN":
            ySnake+=rSnake;
            break;
        case "LEFT":
            xSnake-=rSnake;
            break;
        case "RIGHT":
            xSnake+=rSnake;
            break;
        default:
            break;
    }
    snakeBody.pop();
    snakeBody.unshift([xSnake,ySnake]);
    checkGameOver();
    eatApple();
    drawSnake();
    drawApple();

    gameScore = Math.floor((applesEaten/5) * (applesEaten/keyPresses) * 10000);
    document.getElementById("currentSnakeScore").innerHTML = gameScore.toString();
}

function drawSnake() {
    clearCanvas();
    ctx.save();
    for (i = 0; i < snakeBody.length; i++) {
        ctx.beginPath()
        ctx.fillStyle = "black";
        ctx.arc(snakeBody[i][0], snakeBody[i][1], rSnake, 0, 2 * Math.PI);
        ctx.fill();
        ctx.closePath();
    }
    ctx.restore();
}

function drawApple() {
    ctx.save();
    ctx.beginPath()
    ctx.fillStyle = "red";
    ctx.arc(xApple, yApple, rApple, 0, 2 * Math.PI);
    ctx.fill();
    ctx.closePath();
    ctx.restore();
}

// Helper for drawing on canvas
function clearCanvas() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
}

function eatApple() {
    var delta = Math.pow(xSnake-xApple,2) + Math.pow(ySnake-yApple,2);
    if ( 0 <= delta && delta <= Math.pow(rSnake+rApple,2) ) {
        xApple = Math.floor(Math.random()*545);
        yApple = Math.floor(Math.random()*395);

        applesEaten++;
        snakeBody.push([xSnake,ySnake]);
        gameSpeed-=3;

        clearInterval(id);
        id = setInterval(moveSnake, gameSpeed);
    }
}

function checkGameOver() {
    if (xSnake >= 545 || xSnake < rSnake) {
        snakeGameOver();
    }
    if (ySnake >= 395 || ySnake < rSnake) {
        snakeGameOver();
    }

    var delta;
    for (i = 1; i < snakeBody.length-1; i++) {
        delta = Math.pow(xSnake-snakeBody[i][0],2) + Math.pow(ySnake-snakeBody[i][1],2);
        if(delta < Math.pow(rSnake,2)) {
            snakeGameOver();
        }
    }
}

function snakeGameOver() {
    clearInterval(id);
    run = false;
    newGame = true;
    document.getElementById("gameScore").innerHTML = gameScore.toString();
    document.getElementById("keyPresses").innerHTML = keyPresses.toString();
    document.getElementById("applesEaten").innerHTML = applesEaten.toString();

    $('#snakeGameOverModal').modal('show');
}

function resetSnakeGame() {
    clearInterval(id);
    setupSnakeGame();
    document.getElementById("snakeModal").focus();
}