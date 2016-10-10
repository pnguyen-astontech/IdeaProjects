<%@ include file="../../includes/header.jsp" %>
<%@ include file="../../includes/navbar.jsp" %>
<%@ include file="../../includes/subnav_admin.jsp" %>

<div class="container">

    <%@ include file="admin_user_sidebar.jsp" %>
    <h2>Add new user with admin privileges</h2>

    <div id="userModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Employee Details</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <fieldset>

                            <hidden id="userId" />
                            <hidden id="userVersion" />

                            <div class="form-group">
                                <label for="inputFirstName" class="col-lg-2 control-label">First Name</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="inputFirstName" placeholder="First Name">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputLastName" class="col-lg-2 control-label">Last Name</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="inputLastName" placeholder="Last Name">
                                </div>
                            </div>

                        </fieldset>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="saveEmployee()">Save changes</button>
                </div>

            </div>
        </div>
    </div>

</div>

<%@ include file="../../includes/footer.jsp" %>