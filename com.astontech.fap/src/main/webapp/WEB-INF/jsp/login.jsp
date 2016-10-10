<%@ include file="includes/header.jsp"%>
<%@ include file="includes/navbar.jsp"%>

<c:url value="/static/js/user_login.js" var="userLogin"/>
<script src="${userLogin}"></script>

<script>

    $(document).ready(function () {
        $('#loginModal').modal('show');
        $('#loginModal').on("hidden.bs.modal", function () {
            window.location = "/";
        });
    });

</script>

<%@ include file="index.jsp" %>

<div class="container text-center">

    <div id="loginModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Login to FAP</h4>
                </div>
                <form class="form-horizontal" id="form" action="<c:url value='/login.do'/>" method="POST" name="form">
                    <div class="modal-body">

                        <fieldset>
                            <div>
                                <c:if test="${not empty param.err}">
                                    <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                                </c:if>

                                <c:if test="${not empty param.out}">
                                    <div class="msg-container logout">
                                        You've logged out successfully.
                                    </div>
                                </c:if>

                                <c:if test="${not empty param.time}">
                                    <div class="msg-container time">
                                        You've been logged out due to inactivity.
                                    </div>
                                </c:if>
                            </div>
                        </fieldset>

                        <fieldset class="col-sm-offset-3">
                            <div class="form-group">
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" name="username" value="" placeholder="Enter your username"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-8">
                                    <input class="form-control" type="password"  name="password" value="" placeholder="Enter your password"/>
                                </div>
                            </div>

                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <div class="form-group text-center">
                                <div class="col-sm-8">
                                    <a href="/signup">Create Account</a>
                                </div>
                            </div>
                        </fieldset>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <input value="Login" name="submit" type="submit" class="btn btn-primary"/>
                    </div>

                </form>
            </div>
        </div>
    </div>

</div>

<%@ include file="includes/footer.jsp"%>