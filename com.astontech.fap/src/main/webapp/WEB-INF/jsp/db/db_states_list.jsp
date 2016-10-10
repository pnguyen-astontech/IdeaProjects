<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/navbar.jsp"%>
<%@ include file="../includes/subnav_database.jsp"%>

<c:url value = "/static/js/db/db_states.js" var="dbStates"/>
<script src="${dbStates}"></script>

<script>
    $(document).ready(function () {
        buildTable();
    });
</script>

<div class="container">

    <h2>List all US States</h2>

    <div class="col-sm-10">
        <div class="col-sm-8">
            <table id="state-table" class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>State</th>
                    <th>Abbreviation</th>
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
