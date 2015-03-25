
//= require_tree .
$(document).ready(function() {
  var menuToggle = $('#js-centered-navigation-mobile-menu').unbind();

  $('#js-centered-navigation-menu').removeClass("show");

  menuToggle.on('click', function(e) {
    e.preventDefault();
    $('#js-centered-navigation-menu').slideToggle(function(){
      if($('#js-centered-navigation-menu').is(':hidden')) {
        $('#js-centered-navigation-menu').removeAttr('style');
      }
    });
  });

  $("#modal-1").on("change", function() {
    if ($(this).is(":checked")) {
      $("body").addClass("modal-open");
    } else {
      $("body").removeClass("modal-open");
    }
  });

  $(".modal-window").on("click", function() {
    $(".modal-state:checked").prop("checked", false).change();
  });

  $(".modal-inner").on("click", function(e) {
    e.stopPropagation();
  });

  /* this code is responsible got iframe lazy loading */

  var iframes = $('iframe');

  $('label a').click(function() {
      console.log('test1');
      iframes.attr('src', function() {
          return $(this).data('src');
      });
  });

  iframes.attr('data-src', function() {
      var src = $(this).attr('src');
      $(this).removeAttr('src');
      return src;
  });
});
