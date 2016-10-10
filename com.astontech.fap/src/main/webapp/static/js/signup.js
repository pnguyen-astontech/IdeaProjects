function newUser() {
    var user = {
        id: $('#userId').val(),
        version: $('#userVersion').val(),
        firstName: $('#inputFirstName').val(),
        middleName: null,
        lastName: $('#inputLastName').val(),
        birthDate: $('inputBirthDate').val(),
        gender: $('inputGender').val(),
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
            window.location='/'
        }
    })
}