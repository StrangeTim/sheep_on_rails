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
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function() {
  $('.flash-wrapper').delay(1500).fadeOut(2000);

  $('.add_image').click(function() {
    $('.add_image_form').toggle();
    if ( $('.add_image').text() == "Hide Form") {
      $('.add_image').text("Add Image");
    } else {
      $('.add_image').text("Hide Form");
    }
  });
});
