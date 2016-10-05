<%--Snake game modals--%>
<c:url value="/static/js/games/asteroid.js" var="asteroid" />
<script src="${asteroid}"></script>

<c:url value="/static/css/games/asteroid.css" var="asteroidCSS" />
<link href="${asteroidCSS}" rel="stylesheet" media="screen" />

<div tabindex="0" id="asteroidModal" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="closeAsteroidGame()">&times;</button>
                <h4 class="modal-title">Asteroid</h4>
            </div>

            <div class="modal-body">
                <canvas id="asteroidCanvas" width="550" height="400"></canvas>
            </div>

            <div class="modal-footer">
                <span class="help-block">AWSD or arrow keys to move, space bar to shoot</span>
                <button class="btn btn-primary" onclick="resetAsteroidGame()">Reset</button>
                <button class="btn btn-default" onclick="closeAsteroidGame()">Close</button>
            </div>

        </div>
    </div>
</div>

<div tabindex="0" id="asteroidGameOverModal" class="modal" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">GAME OVER!</h4>
            </div>

            <div class="modal-body">
            </div>

            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>