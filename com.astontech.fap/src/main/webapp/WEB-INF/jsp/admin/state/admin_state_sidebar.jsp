
<div id="sidebar-wrapper" class="col-sm-2">
    <div id="sidebar">
        <ul class="nav list-group">
            <li>
                <a class="list-group-item" onclick="insertState()">New</a>
            </li>
            <li>
                <a class="list-group-item" href="/admin/state/admin_state_list">List All</a>
            </li>
        </ul>
    </div>
</div>

<div id="stateModal" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">State Details</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <fieldset>

                        <hidden id="stateId" />
                        <hidden id="stateVersion" />

                        <div class="form-group">
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="inputStateName" placeholder="State Name">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="inputStateAbbrev" placeholder="Abbreviation">
                            </div>
                        </div>

                    </fieldset>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="saveState()">Save changes</button>
            </div>

        </div>
    </div>
</div>