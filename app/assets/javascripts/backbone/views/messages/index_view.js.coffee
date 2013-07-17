DssMessenger.Views.Messages ||= {}

class DssMessenger.Views.Messages.IndexView extends Backbone.View
  template: JST["backbone/templates/messages/index"]

  events:
    "click .more" : "getMore"

  initialize: () ->
    DssMessenger.messages.bind('reset', @render)
    DssMessenger.messages.bind('add', @addOne)
    window.scrollTo 0, 0

  addAll: () =>
    DssMessenger.messages.each(@addOne)

    console.log DssMessenger.current, DssMessenger.pages
    _.defer =>
      # this will un-hide the 'show more' button if there is more messages
      $(".pagination").removeClass('hidden') if DssMessenger.current < DssMessenger.pages
      # this will affix the table header when scrolled
      $("#mtable-head").affix offset: $("#messages-table").position().top - 40
      $("#mtable-head th").each ->
        $(this).width $(this).width()

  getMore: (e) =>
    e.preventDefault()
    e.stopPropagation()

    $(".pagination").fadeOut() if ++DssMessenger.current >= DssMessenger.pages

    @messages = new DssMessenger.Collections.MessagesCollection()
    @messages.fetch
      data:
        page: DssMessenger.current,
        cl: DssMessenger.filterClassification if DssMessenger.filterClassification > 0,
        mo: DssMessenger.filterModifier if DssMessenger.filterModifier > 0,
        is: DssMessenger.filterService if DssMessenger.filterService > 0,
        me: DssMessenger.filterMevent if DssMessenger.filterMevent > 0

      success: (messages) =>
        DssMessenger.messages.add(messages.models)

      error: (messages, response) ->
        console.log "#{response.status}."
        $("#messages").append("<div class='overlay'><div class='error'>Loading Error</div></div>")
    
  addOne: (message) =>
    view = new DssMessenger.Views.Messages.MessageView({model : message})
    @$("tbody").append(view.render().el)

  render: =>
    $('.overlay,.loading,.error').addClass('hidden')
    @$el.html(@template(messages: DssMessenger.messages.toJSON() ))
    @addAll()

    return this
