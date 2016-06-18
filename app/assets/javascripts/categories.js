$(document).ready(function(){
  addItemListener();
})

// Add to basket
function addItemListener(){
  $('.addItem').on('submit', function(event){
    event.preventDefault();
    var ajaxRequest = $.ajax({
      data: $(this).serialize(),
      url: $(this).attr('action'),
      context: this,
      method: 'post'
    })

    ajaxRequest.done(function(msg) {
      $('.cart').append(msg);
    });

    ajaxRequest.fail(function(msg){
      console.log("Fail");
    });
  });
}
