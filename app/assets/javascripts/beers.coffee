# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".date").inputmask("9999/99/99",{ "placeholder": "aaaa-mm-dd"});

  $('select').material_select()

  input_selector = 'input[type=text],
                    input[type=password],
                    input[type=email],
                    input[type=url],
                    input[type=tel],
                    input[type=number],
                    input[type=search],
                    textarea'

  $(input_selector).each (index, element) ->
    if $(element).val().length > 0 ||
        element.autofocus ||
        $(this).attr('placeholder') != undefined ||
        $(element)[0].validity.badInput == true

      $(this).siblings('label').addClass('active')
    else
      $(this).siblings('label').removeClass('active')

  $('.field_with_errors > label').addClass('active')
