function displayProfile(id) {
    $.getJSON("/api/user/" + id, {
        ajax: 'true'
    }, function (data) {
        $('#displayProfile').append("<h2>" + data.firstName + " " + data.lastName + "</h2>" +
                "<p>Birthday: " + data.birthDate + "</p>" +
                "<p>Gender: " + data.gender + "</p>"
        )
    });
}

function editProfile(id) {
    $.getJSON('/api/user/' + id, {
        ajax: 'true'
    }, function(user) {
        $('#userId').val(user.id);
        $('#userVersion').val(user.version);
        $('#inputFirstName').val(user.firstName);
        $('#inputMiddleName').val(user.middleName);
        $('#inputLastName').val(user.lastName);
        $('#inputBirthDate').val(user.birthDate);
        $('#inputGender').val(user.gender);
        $('#inputUsername').val(user.username);
        $('#inputPassword').val(user.password);
        $('#inputppUrl').val(user.ppUrl);

        $('#editProfile').modal('show');
    });
}

function saveProfile() {
    var user = {
        id: $('#userId').val(),
        version: $('#userVersion').val(),
        firstName: $('#inputFirstName').val(),
        middleName: $('#inputMiddleName').val(),
        lastName: $('#inputLastName').val(),
        birthDate: $('#inputBirthDate').val(),
        gender: $('#inputGender').val(),
        username: $('#inputUsername').val(),
        password: $('#inputPassword').val(),
        ppUrl: null
    }

    $.ajax({
        type: "post",
        data: user,
        url: "/api/user/",
        async: true,
        dataType: "json",
        success: function () {
            window.location.reload();
        }
    })
}