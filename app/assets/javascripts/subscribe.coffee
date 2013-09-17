$(document).ready ->

  $(document).on "click", ".subscribe", (event) ->
    $.ajax
      type: 'post'
      url: '/subscribe'
      data: {category_id: $('.subscribe').attr 'id'}
      success: ->
        $(event.target).text('unsubscribe')
        $(event.target).addClass 'unsubscribe'
        $(event.target).removeClass 'subscribe'

  $(document).on "click", ".unsubscribe", (event) ->
    $.ajax
      type: 'post'
      url: '/unsubscribe'
      data: {category_id: $('.unsubscribe').attr 'id'}
      success: ->
        $(event.target).text('subscribe')
        $(event.target).addClass 'subscribe'
        $(event.target).removeClass 'unsubscribe'

