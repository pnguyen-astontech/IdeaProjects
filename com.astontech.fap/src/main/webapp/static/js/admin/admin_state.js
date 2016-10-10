function buildTable() {
    $.getJSON('/api/state/', {
        ajav: 'true'
    }, function (data) {
        $.each(data, function(index, single) {
            $('#state-table').find('tbody')
                .append("<tr>" +
                    "<td>" + single.id + "</td>" +
                    "<td>" + single.stateName + "</td>" +
                    "<td>" + single.stateAbbreviation + "</td>" +
                    "<td>" + "<button onclick='editState(" + single.id + ")'>Edit</button>" + "</td>" +
                    "<td>" + "<button data-toggle='modal' data-target='#confirmDeleteModal' data-record-id='" + single.id + "'>Delete</button>" + "</td>" +
                    "</tr>");
        });
    });
}

function insertState() {
    // clear fields in modal
    $('#stateId').val("");
    $('#stateVersion').val("");
    $('#inputStateName').val("");
    $('#inputStateAbbrev').val("");
    // open the model
    $('#stateModal').modal('show')

}

function saveState() {
    var state = {
        id: $('#stateId').val(),
        version: $('#stateVersion').val(),
        stateName: $('#inputStateName').val(),
        stateAbbreviation: $('#inputStateAbbrev').val()
    }

    $.ajax({
        type: "post",
        data: state,
        url: "/api/state/",
        async: true,
        dataType: "json",
        success: function () {
            window.location.reload()
        }
    })
}

function editState(id) {
    // retrieve the employee with the passed in id
    $.getJSON('/api/state/' + id, {
        ajax: 'true'
    }, function(state) {
        $('#stateId').val(state.id);
        $('#stateVersion').val(state.version);
        $('#inputStateName').val(state.stateName);
        $('#inputStateAbbrev').val(state.stateAbbreviation);
        // open the model
        $('#stateModal').modal('show')
    })
}

function deleteModal() {
    $('#confirmDeleteModal').on('click', '.btn-ok', function(e) {
        var $modalDiv = $(e.delegateTarget);
        var id = $(this).data('recordId');
        $.ajax({
            type: "delete",
            url: "/api/state/" + id,
            async: true,
            dataType: "json",
            success: function() {
                window.location.reload();
            },
            error: function() {
                alert("Error Deleting State");
            }
        })
    });

    $('#confirmDeleteModal').on('show.bs.modal', function (e) {
        var data = $(e.relatedTarget).data();
        $('.btn-ok', this).data('recordId', data.recordId);
    });

}