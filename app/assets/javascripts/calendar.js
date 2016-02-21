$(document)
  .on('click', '.calendar button[data-turn-id]', function (evt) {
    $('#visit_turn_id').val($(this).data('turn-id'));
    $('#turn_at').val('');
    $('fieldset#new-turn').hide();
    $('fieldset#add-to-turn').show();
  })
  .on('click', '.calendar button.new-turn[data-at]', function (evt) {
    $('#turn_at').val($(this).data('at'));
    $('#turn_employee_id').focus();
    $('#visit_turn_id').val('');
    $('fieldset#add-to-turn').hide();
    $('fieldset#new-turn').show();
  });
