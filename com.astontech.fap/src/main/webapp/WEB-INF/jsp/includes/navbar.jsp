<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="container">
    <nav class="navbar navbar-fixed-top navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <%--HOME--%>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">Home</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <%--PAGE LINKS--%>
                    <li><a href="/profile/${profileUsername}">Profile</a></li>
                    <li><a href="/games">Games</a></li>
                    <li><a href="/db">Databases</a></li>
                    <li><a href="/admin">Admin</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <%--LOGIN LINK--%>
                    <sec:authorize var="loggedIn" access="isAuthenticated()" />
                    <c:choose>
                        <c:when test="${loggedIn}">
                            <li><a href="/logout">logout</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/login">login</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
</div>