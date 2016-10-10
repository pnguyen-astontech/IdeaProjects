<%@ include file="includes/header.jsp"%>
<%@ include file="includes/navbar.jsp"%>

<c:url value="/static/js/signup.js" var="signup"/>
<script src="${signup}"></script>

<div class="container">
    <div class="col-md-10">
        <h2>Create a FAP account</h2>
    </div>
    <div id="main-wrapper" class="col-sm-8">

        <div class="col-xs-6">
            <form class="form-horizontal form-group-sm lb-sm">
                <fieldset>

                    <hidden id="userId" />
                    <hidden id="userVersion" />

                    <div class="form-group">
                        <label class="col-xs-12">Name</label>
                        <div class="col-xs-6">
                            <input class="form-control" type="text" id="inputFirstName" placeholder="First"/>
                        </div>

                        <div class="col-xs-6">
                            <input class="form-control" type="text" id="inputLastName" placeholder="Last"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12" for="inputUsername">Choose your username</label>
                        <div class="col-xs-12">
                            <input class="form-control" type="text" id="inputUsername"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12" for="inputPassword">Create password</label>
                        <div class="col-xs-12">
                            <input class="form-control" type="password" id="inputPassword"/>
                            <span class="help-block">Help text goes here...</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12" for="confirmPassword">Confirm password</label>
                        <div class="col-xs-12">
                            <input class="form-control" type="password" id="confirmPassword"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12">Birthday</label>
                        <div class="col-xs-4">
                            <input class="form-control" type="text" id="inputBirthDay" placeholder="Day"/>
                        </div>
                        <div class="col-xs-4">
                            <input class="form-control" type="text" id="inputBirthMonth" placeholder="Month"/>
                        </div>
                        <div class="col-xs-4">
                            <input class="form-control" type="text" id="inputBirthYear" placeholder="Year"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12" for="inputGender">Gender</label>
                        <div class="col-xs-12">
                            <input class="form-control" type="text" id="inputGender"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12" for="inputPhoneNumber">Phone number</label>
                        <div class="col-xs-12">
                            <input class="form-control" type="text" id="inputPhoneNumber"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12" for="inputEmail">Email address</label>
                        <div class="col-xs-12">
                            <input class="form-control" type="text" id="inputEmail"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-12">
                            <button type="button" class="btn btn-primary btn-ok" onclick="newUser()">Submit</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>

    </div>

</div>

<%@ include file="includes/footer.jsp"%>