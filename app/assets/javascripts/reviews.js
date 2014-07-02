$(document).ready(function(){
  $('.new_review').on('submit', function(event) {
    event.preventDefault();
    var restaurant = $(this).closest('.restaurant');

    $.post($(this).attr('action'), $(this).serialize(), function(review) {
      restaurant.find('ul.reviews').append('<li>' + review.thoughts + ' (' + review.rating + ')</li>')
      restaurant.find('.average_rating').text(review.new_average_rating)
    });
  })
})