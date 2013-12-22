class LedgerWeb.Views.Menu extends Backbone.View
  template: JST['menu']

  render: ->
    @$el.html(@template())
    this
