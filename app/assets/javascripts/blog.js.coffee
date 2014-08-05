# Nested field - translation
$('#translations').on "cocoon:after-insert", (e, insertedItem) ->
  position = $("#translations .nested-fields").index(insertedItem)
  console.log position
  insertedItemId = 'tab-' + position
  insertedItem.attr 'id', insertedItemId
  $('#translations .nested-fields').removeClass 'active'
  insertedItem.addClass 'active'

  # Add link to navigation bar
  translation = $("<li class=\"active "+insertedItemId+"\"><a data-toggle=\"tab\" href=\"#"+insertedItemId+"\"> + </a></li>")
  $('#translations .nav-tabs li').removeClass 'active'
  $('#translations .nav-tabs').append translation

$(document).ready ->
  $("#post_category_ids").select2()