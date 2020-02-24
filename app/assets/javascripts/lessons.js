$(document).on('turbolinks:load', function() {
  $('.js-file-lesson-document').on('change', function() {
    var file = $(this)[0].files[0];

    var reader = new FileReader();
    reader.onload = function(e) {
      $('.js-iframe-lesson-document').attr('src', e.target.result);
    }
    reader.readAsDataURL(file);
  });
});
