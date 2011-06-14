$(document).ready(function(){
  if ($.browser.webkit) {
    $('#print_button, #uniform-print_button').show();
   }
   
  function move_along($selector, limit, $next) {
    $selector.live('keydown', function(e) {
      if ($next == null) { $next = $(this).next(); }
      if( e.which != 8 && $(this).val().length >= limit ) $next.focus()
    });
  }

		move_along($('input.bank'), 2)
		move_along($('input.branch'), 4)
		move_along($('input.account'), 7)
		move_along($('input.suffix'), 3, $('input.suffix').parent().next().find('input:visible').first())
		move_along($('#application_form_gst_number_1'), 3)
		move_along($('#application_form_gst_number_2'), 3)
		move_along($('#application_form_gst_number_3'), 3, $('#application_form_contact_name'))
	
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
})