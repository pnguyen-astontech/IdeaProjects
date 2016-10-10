<%@ include file="includes/header.jsp"%>
<%@ include file="includes/navbar.jsp"%>

<c:url value="/static/js/profile.js" var="profile"/>
<script src="${profile}"></script>

<script>
    $(document).ready(function () {
        displayProfile(${profileId});
    })
</script>

<%@ include file="includes/subnav_profile.jsp" %>

<img src="../../static/images/ryan.jpeg" class="center-block img-circle "  width="150" height="150"/>


<div class="container">

    <div id="displayProfile" class="center-block text-center"></div>

    <%--<hidden id="profileId" value="${profileId}" />--%>

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
                            <hidden id="inputUsername" />
                            <hiddne id="inputPassword" />

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

                            <div class="form-group col-xs-12">
                                <label class="col-xs-12">Birthday</label>
                                    <div class="col-xs-4">
                                        <input class="form-control" type="text" id="inputBirthDate" placeholder="Birth Date"/>
                                    </div>
                            <%--<div class="col-xs-4">--%>
                                <%--<input class="form-control" type="text" id="inputBirthDay" placeholder="Day"/>--%>
                            <%--</div>--%>
                            <%--<div class="col-xs-4">--%>
                                <%--<input class="form-control" type="text" id="inputBirthMonth" placeholder="Month"/>--%>
                            <%--</div>--%>
                            <%--<div class="col-xs-4">--%>
                                <%--<input class="form-control" type="text" id="inputBirthYear" placeholder="Year"/>--%>
                            <%--</div>--%>
                            </div>


                            <div class="form-group col-xs-12">
                                <label class="col-xs-12" for="inputGender">Gender</label>
                                <div class="col-xs-12">
                                    <input class="form-control" type="text" id="inputGender"/>
                                </div>
                            </div>

                        </fieldset>
                    </form>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btn-ok" onclick="saveProfile()">Submit</button>
                </div>
            </div>
        </div>
    </div>

</div>


<%@ include file="includes/footer.jsp"%>