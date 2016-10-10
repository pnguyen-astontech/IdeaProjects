<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/navbar.jsp"%>
<%@ include file="../includes/subnav_database.jsp"%>

<c:url value = "/static/js/db/db_users.js" var="dbUsers"/>
<script src="${dbUsers}"></script>

<script>
    $(document).ready(function () {
        buildTable();
    });
</script>

<div class="container">

    <h2>List all users</h2>

    <div class="col-sm-10">
        <div class="col-sm-8">
            <table id="user-table" class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Username</th>
                    <th>Name</th>
                </tr>
                </thead>
                <tbody>
                <%--jquery will append our data here--%>
                </tbody>
            </table>
        </div>
    </div>

</div>

<%@ include file="../includes/footer.jsp" %>