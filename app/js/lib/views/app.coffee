class LedgerWeb.Views.App extends Backbone.View
  template: JST['app']

  initialize: ->
    @model.on('change showMenu', @updateMenu)

  updateMenu: =>
    @$el.toggleClass('show-menu', @model.get('showMenu'))

  render: ->
    @$el.html(@template())
    @updateMenu()
    this
