<%--Snake game modals--%>
<c:url value="/static/js/games/snake.js" var="snake" />
<script src="${snake}"></script>

<c:url value="/static/css/games/snake.css" var="snakeCSS" />
<link href="${snakeCSS}" rel="stylesheet" media="screen" />

<div tabindex="0" id="snakeModal" class="modal" onkeydown="keyInput()">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="closeSnakeGame()">&times;</button>
                <h4 class="modal-title">Snake</h4>
            </div>

            <div class="modal-body">
                <canvas id="snakeCanvas" width="550" height="400"></canvas>
            </div>

            <div class="modal-footer">
                <div>
                    Score: <p id="currentSnakeScore"></p>
                </div>
                <span class="help-block">AWSD or arrow keys to move, space bar to start/stop</span>
                <button class="btn btn-primary" onclick="resetSnakeGame()">Reset</button>
                <button class="btn btn-default" onclick="closeSnakeGame()">Close</button>
            </div>

        </div>
    </div>
</div>

<div tabindex="0" id="snakeGameOverModal" class="modal" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">GAME OVER!</h4>
            </div>

            <div class="modal-body">
                <div>
                    Key strokes: <p id="keyPresses"></p>
                    Apples: <p id="applesEaten"></p>
                    SCORE: <p id="gameScore"></p>
                </div>
            </div>

            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>