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
                    "<td>" + "<button onclick='editUser(" + single.id + ")'>Edit</button>" + "</td>" +
                    "<td>" + "<button data-toggle='modal' data-target='#confirmDeleteModal' data-record-id='" + single.id + "'>Delete</button>" + "</td>" +
                    "</tr>");
        });
    });
}

function editUser(id) {
    // retrieve the employee with the passed in id
    $.getJSON('/api/user/' + id, {
        ajax: 'true'
    }, function(user) {
//        console.log(employee);
//        populate values (hidden and input)
        $('#userId').val(user.id);
        $('#userVersion').val(user.version);
        $('#inputFirstName').val(user.firstName);
        $('#inputMiddleName').val(user.middleName)
        $('#inputLastName').val(user.lastName);
        $('#inputBirthDate').val(user.birthDate);
        $('#inputGender').val(user.gender);
        $('#inputUsername').val(user.username);
        $('#inputPassword').val(user.password);
        $()
        // open the model
        $('#userModal').modal('show')
    })
}

function deleteModal() {

}