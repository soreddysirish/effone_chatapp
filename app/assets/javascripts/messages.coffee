# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  refreshingPartial = ->
    $.ajax
      url: '/users/messages'
      type: 'GET'
      dataType: 'script'
    return

  refreshingPartial()
  setInterval refreshingPartial, 1000
  return
