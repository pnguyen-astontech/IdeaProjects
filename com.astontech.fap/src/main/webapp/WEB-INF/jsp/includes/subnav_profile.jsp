<nav class="navbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <%--ADMIN HOME--%>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/profile/${profileUsername}">Profile</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse-2">
            <ul class="nav navbar-nav">
                <%--PAGE LINKS--%>
                <li><a onclick="editProfile(${profileId})">Edit</a></li>
            </ul>
            <p class="navbar-text navbar-right">Signed in as <a class="navbar-link">${profileUsername}</a></p>
        </div>

    </div>
</nav>