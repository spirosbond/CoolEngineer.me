// This is a manifest file that'll be compiled into application.js used for the Main Layout.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-3.3.1.min
//= require materialize.min
//= require anime.min
//= require noframework.waypoints.min
//= require meerkatutils
//= require spinner
//= require cookieconsent.min
//= require_self

M.AutoInit();
$('.datepicker.birthday').datepicker({
    format: 'yyyy-mm-dd',
    yearRange: [1950, (new Date()).getFullYear()],
    maxDate: new Date(),
    showDaysInNextAndPreviousMonths: true,
    setDefaultDate: true
});
$('.datepicker.pastday').datepicker({
    format: 'yyyy-mm-dd',
    yearRange: [1950, (new Date()).getFullYear()],
    maxDate: new Date(),
    showDaysInNextAndPreviousMonths: true,
    setDefaultDate: true
});
$('.character-counter').characterCounter();

function checkboxClicked(checkboxId, disableId) {
    if (document.getElementById(checkboxId).checked) {
        document.getElementById(disableId).disabled = true;
    } else {
        document.getElementById(disableId).disabled = false;
    }
}

function readURL(imageId, input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#' + imageId).attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

$(document).ready(function () {

    $('ul.tabs').on('click', 'a', function (e) {
        console.log(e.target.hash);
        // window.location.hash = e.target.hash;
        history.pushState(null, null, e.target.hash);
    });

});

function hide(element){
    element.classList.add("hide");
}