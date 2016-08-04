// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
// //
// = require jquery
// = require jquery_ujs
// = require_tree .
$(document).ready(function(){

// alert('hello')

  $(function() {
    var $form = $('#payment-form');
    $form.submit(function(event) {
      // Disable the submit button to prevent repeated clicks:
      $form.find('.submit').prop('disabled', true);

      // Request a token from Stripe:
      Stripe.card.createToken($form, stripeResponseHandler);
      // Prevent the form from being submitted:
      return false;
    });
  });

  function stripeResponseHandler(status, response) {
  // Grab the form:
    var $form = $('#payment-form');

    if (response.error) { // Problem!

      // Show the errors on the form:
      $form.find('.payment-errors').text(response.error.message);
      $form.find('.submit').prop('disabled', false); // Re-enable submission

    } else { // Token was created!

      // Get the token ID:
      var token = response.id;

      // Insert the token ID into the form so it gets submitted to the server:
      // Multiple ways to do this.
      $form.append($('<input type="hidden" name="stripeToken">').val(token));

      // Submit the form:
      $form.get(0).submit();
    }
  };


});
