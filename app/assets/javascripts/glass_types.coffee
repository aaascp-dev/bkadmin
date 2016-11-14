# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.modal').modal();

  $('.chips-initial').material_chip({data});

  $( "div.chips > input.input").remove();

  $('.chips-initial').on "chip.delete", (event, chip) ->
    $('#delete_chip_confirmation_glass_type').val(chip.id)
    $('#delete_chip_confirmation_glass_type').text(chip.tag)
    $('#destroy_glass_type_button').attr("href", "/glass_types/" + chip.id)
    $('#delete_chip_confirmation').modal('open')
