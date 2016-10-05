<%@ include file="includes/header.jsp"%>
<%@ include file="includes/navbar.jsp"%>

<c:url value="/static/js/profile.js" var="profile"/>
<script src="${profile}"></script>

<div class="container">

    <div class="col-xs-12">
        <h2>Profile Page</h2>
        <img src="../../static/images/profile-placeholder.png" class="pull-right" width="150" height="150"/>
    </div>
    <div>

    </div>

    <div id="editProfile" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Edit Profile</h4>
                </div>

                <div class="modal-body">
                    <form class="form-horizontal">
                        <fieldset>
                            <hidden id="userId" />
                            <hidden id="userVersion" />

                            <div class="form-group col-xs-12">
                                <div class="col-xs-4">
                                    <input type="text" class="form-control" id="inputFirstName" placeholder="First">
                                </div>
                                <div class="col-xs-4">
                                    <input type="text" class="form-control" id="inputMiddleName" placeholder="Middle">
                                </div>
                                <div class="col-xs-4">
                                    <input type="text" class="form-control" id="inputLastName" placeholder="Last">
                                </div>
                            </div>

                        </fieldset>
                    </form>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">Close</button>
                    <button class="btn btn-default" data-dismiss="modal">Submit</button>
                </div>
            </div>
        </div>
    </div>

</div>

<%@ include file="includes/subnav_profile.jsp" %>
<%@ include file="includes/footer.jsp"%>