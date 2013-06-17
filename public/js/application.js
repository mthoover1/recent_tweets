$(document).ready(function() {
  $('.search-tweets').click(function(event){
    event.preventDefault();
    $('.tweets-container').html('<img src="img/gears.gif">');
    user = $('input[name=username]').val();
    $.post('/'+user, function(tweets){
      $('.tweets-container').html(tweets);
    })
  })
});
