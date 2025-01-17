handleVisibilityChange = ->
  $strike = $(".strike")
  if $strike.length > 0
    chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
    App.last_read.update(chatroom_id)
    $strike.remove()

$(document).on "turbolinks:load", ->
  $(document).on "click", handleVisibilityChange
  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13 && !event.shiftKey
      e.preventDefault()
      $(this).submit()

  $('#new_message').on "submit", (e) ->
    edi = document.querySelector("trix-editor")
    e.preventDefault()
    chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
    content     = $("#message_content")

    App.chatrooms.send_message(chatroom_id, edi.innerHTML)

    edi.editor.loadHTML("")
