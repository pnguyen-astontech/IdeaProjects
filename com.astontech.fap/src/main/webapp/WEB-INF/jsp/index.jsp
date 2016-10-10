<%@ include file="includes/header.jsp"%>
<%@ include file="includes/navbar.jsp"%>

<c:url value="/static/js/index.js" var="index"/>
<script src="${index}"></script>

<script>
//    $('.item').height($(window).height());
</script>


    <div id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <div class="fill" style="background-image:url('../../static/images/shia_labeouf_tribeca_h_2015.jpg');">
                    <div class="col-sm-offset-1 shift-down-25 text-muted">
                        <p class="image-text"><b>SHIA LABEOUF</b></p>
                        <p class="image-text">2X OLYMPIC GOLD MOTIVATOR</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
                <div class="fill" style="background-image:url('../../static/images/tb_1.jpg');">
                    <div class="col-sm-offset-1 shift-down-25 text-muted">
                        <p class="image-text"><b>TOM BRADY</b></p>
                        <p class="image-text">SALT MAGIC WORLD RECORD HOLDER</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image:url('../../static/images/killer-joe-Killer_joe_004_rgb.jpeg');">
                    <div class="col-sm-offset-1 shift-down-25 text-muted">
                        <p class="image-text"><b>MATTHEW MCCONAUGHEY</b></p>
                        <p class="image-text">PRO TIME TRAVELLER</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>

    </div>


<div class="container-fluid center-block">

        <div class="col-lg-4 col-lg-offset-3">
        <h2>F2</h2>
        <h3>Wireless Fap</h3>
        <p>
            Text goes here
            <br> a
            <br> a
            <br> a
            <br> a
            <br> a
            <br> a
            <br> a
            <br> a
        </p>
        </div>

        <div class="col-lg-1">
            <div class="img-responsive center-block float-right">
                <img src="../../static/images/tp.jpg">
            </div>
        </div>

</div>

<%--<div class="img-responsive">--%>
    <%--<img class="width-100" src="../../static/images/Space-3d-Hd-Desktop-1080p.jpg">--%>
<%--</div>--%>

<%@ include file="includes/footer.jsp"%>