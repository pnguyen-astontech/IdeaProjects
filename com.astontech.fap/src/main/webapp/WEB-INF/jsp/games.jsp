<%@ include file="includes/header.jsp"%>
<%@ include file="includes/navbar.jsp"%>

<script>
    $(document).ready(function () {
        $('#snakeModal').on('shown.bs.modal', function () {
            openSnakeGame();
        })
        $('#snakeModal').on('hidden.bs.modal', function () {
            closeSnakeGame();
        });

        $('#asteroidModal').on('shown.bs.modal', function () {
            openAsteroidGame();
        })
        $('#asteroidModal').on('hidden.bs.modal', function () {
            closeAsteroidGame();
        })
    });
</script>

<div class="container">

    <h2>Games Page</h2>

    <%--BUTTONS--%>
    <div class="col-md-2">
        <button data-toggle="modal" data-target="#snakeModal" class="btn btn-lg btn-block btn-default">Snake</button>
    </div>

    <div class="col-md-2">
        <button data-toggle="modal" data-target="#asteroidModal" class="btn btn-lg btn-block btn-default">Asteroid</button>
    </div>

    <%--MODALS--%>
    <%@ include file="games/snake.jsp"%>
    <%@ include file="games/asteroid.jsp"%>

</div>

<%@ include file="includes/footer.jsp"%>