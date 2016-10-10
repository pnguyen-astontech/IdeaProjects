<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/navbar.jsp"%>
<%@ include file="../../includes/subnav_admin.jsp"%>

<c:url value = "/static/js/admin/admin_state.js" var="adminState"/>
<script src="${adminState}"></script>

<script>
    $(document).ready(function () {
        buildTable();
        deleteModal();
    });
</script>

<div class="container">

    <%@ include file="admin_state_sidebar.jsp" %>
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

    <div id="confirmDeleteModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Confirm Delete</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete? This cannot be undone!</p>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-danger btn-ok" data-dismiss="modal" id="confirmDelete">Delete</button>
                </div>

            </div>
        </div>
    </div>

</div>

<%@ include file="../../includes/footer.jsp" %>