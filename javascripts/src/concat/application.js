$('#lang-menu-toggle').click(function(event) {
  event.stopPropagation();
  $(this).toggleClass('open');
  $('#toggleable-lang-menu').toggleClass('expanded');
});
$('body').on('click', function(event) {
  var $t = $(event.target);
  if ($t.closest('.toggleable-lang-menu').length === 0 && !$t.is('#toggleable-lang-menu')) {
    $('#toggleable-lang-menu').removeClass('expanded');
  }
  $('#lang-menu-toggle').removeClass('open');
});

$('html').click(function(event) {
  var $t = $(event.target);
  if ($t.closest('.mobile-menu').length === 0 && $t.closest('.toggle-btn').length === 0) {
    if ($('.mobile-menu').hasClass('expanded')) {
      $('.mobile-menu').removeClass('expanded');
      $('.js-menu-toggle').removeClass('open');
    }
  }
});
