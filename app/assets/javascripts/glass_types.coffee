# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.modal').modal();

  $('.chips').material_chip();

  $('.chips-initial').material_chip({data});

  $('.chips').on "chip.delete", (e, chip) ->
    $('#delete_chip_confirmation_glass_type').val(chip.id)
    $('#delete_chip_confirmation_glass_type').text(chip.tag)
    $('#delete_chip_confirmation').modal('open')

  $('.chips').on "chip.add", (e, chip) ->
    $('#glass_type_name').val(chip.tag)
    $('#new_glass_type')
      .on("ajax:success", (e, data, status, xhr) ->
        alert data)
      .on("ajax:error", (e, xhr, status, error) ->
        $('.chips .close').trigger('click'))
      .submit()
