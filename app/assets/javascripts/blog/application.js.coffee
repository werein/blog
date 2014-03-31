# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require cocoon
#= require ckeditor/override
#= require ckeditor/init
#= require select2

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