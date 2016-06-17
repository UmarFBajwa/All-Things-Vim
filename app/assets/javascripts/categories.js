$(document).ready(function(){
  addItemListener();
})

// Add to basket
function addItemListener(){
  $('.addItem').on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr('action');
    var context = this;

    var ajaxRequest = $.ajax({
      data: data,
      url: url,
      context: this,
      method: 'post'
    })

    ajaxRequest.done(function(msg) {
      // alert(this);
      console.log(msg);
      $('.cart').append(msg);

    });

    ajaxRequest.fail(function(msg){
      console.log("Fail");
    });
  });
}
