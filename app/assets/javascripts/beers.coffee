# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 15,
    format: 'dd-mm-yyyy',
    closeOnSelect: true,
    monthsFull: [ 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
                  'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Decembro' ],
    monthsShort: [ 'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dec' ],
    weekdaysFull: [ 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo' ],
    weekdaysShort: [ 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom' ],
    today: 'Hoje',
    clear: 'Limpar',
    close: 'Fechar'
  })

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
