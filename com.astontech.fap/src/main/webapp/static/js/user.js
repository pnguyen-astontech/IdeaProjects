function buildTable() {
    $.getJSON('/api/user/', {
        ajav: 'true'
    }, function (data) {
        $.each(data, function(index, single) {
            var fullname = single.firstName + " " + single.lastName;
            $('#user-table').find('tbody')
                .append("<tr>" +
                    "<td>" + single.id + "</td>" +
                    "<td>" + single.username + "</td>" +
                    "<td>" + fullname + "</td>" +
            "</tr>");
        });
    });
}