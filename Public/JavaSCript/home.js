$(document).ready(function () {
    sendTypeView();
});



function getMainTeams() {
    $.ajax({
        type: "POST",
        url: "",
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: {},
        success: function(data) {
            console.log(data);
        },
        error: function(data) {
            console.log(data);
        }
    });
}