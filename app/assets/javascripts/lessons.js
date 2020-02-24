$(document).on('turbolinks:load', function() {
  $('.js-file-lesson-document').on('change', function() {
    var file = $(this)[0].files[0];

    var reader = new FileReader();
    reader.onload = function(e) {
      $('.js-iframe-lesson-document').attr('src', e.target.result);
    }
    reader.readAsDataURL(file);
  });

  var fullViewCanvas = $('.js-canvas-fullview-pdf');
  var fullViewUrl = fullViewCanvas.data('url');
  var fullViewPdf = null;
  var fullViewPage = null;

  if (fullViewUrl != undefined) {
    pdfjsLib.getDocument(fullViewUrl).promise.then(function(pdf) {
      fullViewPdf = pdf;
      fullViewPage = 1;

      renderPdf(fullViewPdf, fullViewPage, fullViewCanvas[0]);
    });
  }

  function renderPdf(pdf, page, canvas) {
    pdf.getPage(page).then(function(page) {
      var viewport = page.getViewport(1);
      var context = canvas.getContext('2d');
      canvas.height = viewport.height;
      canvas.width = viewport.width;

      var renderContext = {
        canvasContext: context,
        viewport: viewport
      };
      page.render(renderContext);
    });
  }
});
