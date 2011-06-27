$(document).ready(function(){
  function move_along($selector, limit, $next_param) {
    $selector.live('keydown', function(e) {
      if ($next_param == null) { $next = $(this).closest('.field').next().find('input'); if($next.length == 0) $next = $(this).closest('.field').parent().next().find('input'); }
      else { $next = $(this).closest('.field').find($next_param); }
      if( e.which != 8 && $(this).val().length >= limit ) $next.focus()
    });
  }

		move_along($('input.bank'), 2, 'input.branch')
		move_along($('input.branch'), 4, 'input.account')
		move_along($('input.account'), 7, 'input.suffix')
		move_along($('input.suffix'), 3)
		move_along($('#entity_gst_number_1'), 3, '#entity_gst_number_2')
		move_along($('#entity_gst_number_2'), 3, '#entity_gst_number_3')
		move_along($('#entity_gst_number_3'), 3)
	
    $("input, input[type=submit], select").uniform();
  	
  $('#same-address, #application_form_physical_address_1, #application_form_physical_address_2, #application_form_physical_address_3, #application_form_physical_postcode').keydown(function(){
    copy_addresses();
  });
  
  function copy_addresses() {
    if($('#same-address:checked').val() == 1) {
      $('#postal_address').hide();
      $('#application_form_postal_address_1').val($('#application_form_physical_address_1').val());
      $('#application_form_postal_address_2').val($('#application_form_physical_address_2').val());
      $('#application_form_postal_address_3').val($('#application_form_physical_address_3').val());
      $('#application_form_postal_postcode').val($('#application_form_physical_postcode').val());
    }
    else {
      $('#postal_address').show();
    }
  }
  
  function bartercard() {
    if($('#bartercard-member:checked').val() == 1)
      $('#bartercard_fields').show();
    else
      $('#bartercard_fields').hide(); 
  }
  
  bartercard();
  $('#bartercard-member').change(bartercard);
  
  // $('#pdf').load(function(){
  //   frames['pdf'].print()
  // })
  
  if($.browser.webkit) {
    $('#print_button, #uniform-print_button').show();
   }
})