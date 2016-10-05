<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>

<c:url value = "/static/js/user.js" var="user"/>
<script src="${user}"></script>

<script>
    $(document).ready(function () {
        buildTable();
    });
</script>

<div class="container">
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

<%@ include file="includes/footer.jsp" %>
