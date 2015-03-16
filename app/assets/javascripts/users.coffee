$ ->
  $(".task_title").mouseover ->
    $(".task_edit_del").hide()
    $("#task_edit_del_#{@id}").show()

$ -> 
  $('#add-more').click ->
    $('#create-task').show()
    $('#add-more').hide()

$ ->
  $('.period').click ->
    $('.score').hide()
    target = $(this).context.className.replace(/period|active/g,'')
    target = "##{$.trim(target)}"
    $(target).show()
    $('.period').removeClass('active')
    $(this).addClass('active')
