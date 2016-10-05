<div class="col-sm-4">
    <%--ALERTS--%>
    <%--SUCCESS ALERT--%>
    <div class="${successAlert == null ? 'hidden' : successAlert}" id="successAlert">
        <div class="alert alert-dismissible alert-success">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>Success!</strong>
        </div>
    </div>

    <%--ERROR ALERT--%>
    <div class="${errorAlert == null ? 'hidden' : errorAlert}" id="errorAlert">
        <div class="alert alert-dismissible alert-danger">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>ERROR!</strong>Do something here
        </div>
    </div>

    <%--WARNING ALERT--%>
    <div class="${warningAlert == null ? 'hidden' : warningAlert}" id="warningAlert">
        <div class="alert alert-dismissible alert-warning">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Be Advised!</h4>
        </div>
    </div>
</div>