<script>
    $(document).ready(function () {
        $('#editProfileLink').click(function () {
            $('#editProfile').modal('show');
            return false;
        })
    })
</script>



<nav class="navbar navbar-fixed-bottom">
    <div class="container-fluid">
        <div class="navbar-header">
            <%--ADMIN HOME--%>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/profile">Profile</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse-2">
            <ul class="nav navbar-nav">
                <%--PAGE LINKS--%>
                <li><a id="editProfileLink">Edit</a></li>
            </ul>
            <p class="navbar-text navbar-right">Signed in as <a href="#" class="navbar-link">Mark Otto</a></p>
        </div>

    </div>
</nav>