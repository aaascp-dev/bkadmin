# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.modal').modal()

  $('.chips-initial').material_chip({data})

  $( 'div.chips > input.input').remove()

  $('.chip').on "dblclick", (event) ->
    chipIndex =  $(event.target).index()
    chip = $('.chips-initial').find('.chip').eq(chipIndex)
    if (chip)
      $('.chips-initial').trigger('chip.select', $('.chips-initial').data('chips')[chipIndex])

  $('.chips-initial').on "chip.select", (event, chip) ->
    url = '/beer_characteristics/' + chip.id + '/edit'
    $.ajax url,
        type: 'GET'
        dataType: 'html'
        success: (data, textStatus, jqXHR) ->
          $('#edit_chip').empty()
          $('#edit_chip').append data
          $('#edit_chip').modal('open')

  $('.chips-initial').on "chip.delete", (event, chip) ->
    $('#delete_chip_confirmation_beer_characteristic').val(chip.id)
    $('#delete_chip_confirmation_beer_characteristic').text(chip.tag)
    $('#destroy_beer_characteristic_button').attr("href", "/beer_characteristics/" + chip.id)
    $('#delete_chip_confirmation').modal('open')

  $('.field_with_errors > .validate').removeClass('valid').addClass('invalid')

  $('.field_with_errors > label').addClass('active')
