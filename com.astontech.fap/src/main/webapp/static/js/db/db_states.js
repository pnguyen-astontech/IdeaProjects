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
                    "</tr>");
        });
    });
}
