$(document)
  .on('click', '.calendar [data-turn-id]', function (evt) {
    $('#visit_turn_id').val($(this).data('turn-id'));
    $('#turn_at').val('');
    $('fieldset#new-turn').hide();
    $('fieldset#add-to-turn').show();
  })
  .on('click', '.calendar h1 button[data-at]', function (evt) {
    $('#visit_turn_attributes_at').val($(this).data('at'));
    $('#visit_turn_attributes_employee_id').focus();
    $('#visit_turn_id').val('');
    $('fieldset#add-to-turn').hide();
    $('fieldset#new-turn').show();
  });
