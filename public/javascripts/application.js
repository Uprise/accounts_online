$(document).ready(function(){
  $('#same-address, #application_form_physical_address_1, #application_form_physical_address_2, #application_form_physical_address_3, #application_form_physical_postcode').change(function(){
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
})