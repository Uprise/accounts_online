jQuery(function($) {
  function init_slider(slider) {
    var start_val = 0;
    slider.slider({ max: 300, value: start_val });
    slider.parent().find('.number_of_transactions_slider_text').text(start_val + " transactions");
    slider.bind( "slide", function(event, ui) {
      slider.parent().find('input').val(ui.value);
      slider.parent().find('.number_of_transactions_slider_text').text(ui.value + " transactions");
    });
  }
  
  $('form a.add_nested_fields').live('click', function() {
    // Setup
    var assoc   = $(this).attr('data-association');            // Name of child
    var content = $('#' + assoc + '_fields_blueprint').html(); // Fields template

    // Make the context correct by replacing new_<parents> with the generated ID
    // of each of the parent objects
    var context = ($(this).closest('.fields').find('input:first').attr('name') || '').replace(new RegExp('\[[a-z]+\]$'), '');

    // context will be something like this for a brand new form:
    // project[tasks_attributes][new_1255929127459][assignments_attributes][new_1255929128105]
    // or for an edit form:
    // project[tasks_attributes][0][assignments_attributes][1]
    // if(context) {
    //   var parent_names = context.match(/[a-z_]+_attributes/g) || [];
    //   var parent_ids   = context.match(/(new_)?[0-9]+/g) || [];
    // 
    //   for(i = 0; i < parent_names.length; i++) {
    //     if(parent_ids[i]) {
    //       content = content.replace(
    //         new RegExp('(_' + parent_names[i] + ')_.+?_', 'g'),
    //         '$1_' + parent_ids[i] + '_');
    // 
    //       content = content.replace(
    //         new RegExp('(\\[' + parent_names[i] + '\\])\\[.+?\\]', 'g'),
    //         '$1[' + parent_ids[i] + ']');
    //     }
    //   }
    // }

    // Make a unique ID for the new child
    var regexp  = new RegExp('new_' + assoc, 'g');
    var new_id  = new Date().getTime();
    content     = content.replace(regexp, "new_" + new_id);

    $(this).before(content);
          
init_slider($('#application_form_'+assoc+'_attributes_new_'+new_id+'_number_of_transactions').parent().find('.number_of_transactions_slider'))
    check_maximum();
    $(this).closest("form").trigger('nested:fieldAdded');
    return false;
  });

  $('form a.remove_nested_fields').live('click', function() {
    var hidden_field = $(this).prev('input[type=hidden]')[0];
    if(hidden_field) {
      hidden_field.value = '1';
    }
    $(this).closest('.fields').hide();
    check_maximum();
    $(this).closest("form").trigger('nested:fieldRemoved');
    return false;
  });
  
  function check_maximum() {
    $('form a.add_nested_fields').each(function(){
      var assoc   = $(this).attr('data-association');            // Name of child
      var maximum = $(this).attr('data-maximum');                // Maximum # of children
      $('.' + assoc+':visible').length >= maximum ? $(this).hide() : $(this).show();
    });
  }
  
  check_maximum();
});
