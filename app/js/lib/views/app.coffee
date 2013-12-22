class LedgerWeb.Views.App extends Backbone.View
  template: JST['app']

  events:
    'click .blocking-layer': 'hideMenu'

  hideMenu: =>
    @model.set(showMenu: false)

  initialize: ->
    @model.on('change showMenu', @toggleShowMenuClass)

  toggleShowMenuClass: =>
    @$el.toggleClass('show-menu', @model.get('showMenu'))

  render: ->
    @$el.html(@template())
    @menuView = new LedgerWeb.Views.Menu
      model: @model
      el: @$el.find('#side-menu')
    @menuView.render()
    @toggleShowMenuClass()
    this
