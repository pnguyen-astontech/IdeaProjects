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

<div id="gameCarousel" class="carousel slide height-100">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#gameCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#gameCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item active">
            <div class="fill" style="background-image:url('../../static/images/f3-figure-bg.jpg');">
                <img class="center-block shift-down-img" src="../../static/images/f2-graph-02.png">
            </div>
            <div class="carousel-caption">
                <div class="col-sm-2 col-sm-offset-5 shift-up">
                <h1><button data-toggle="modal" data-target="#snakeModal" class="btn btn-md btn-transparent text-black">Snake</button></h1>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="fill" style="background-image:url('../../static/images/f1-figure-bg.jpg');"></div>
            <div class="carousel-caption">
                 <div class="col-sm-2 col-sm-offset-5 shift-up">
                    <button data-toggle="modal" data-target="#asteroidModal" class="btn btn-md btn-primary">Asteroid</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#gameCarousel" data-slide="prev">
        <span class="icon-prev"></span>
    </a>
    <a class="right carousel-control" href="#gameCarousel" data-slide="next">
        <span class="icon-next"></span>
    </a>
</div>

    <%@ include file="games/snake.jsp"%>
    <%@ include file="games/asteroid.jsp"%>


<%@ include file="includes/footer.jsp"%>