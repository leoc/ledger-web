class LedgerWeb.Router extends Backbone.Router
  routes:
    '': 'nothing'

  initialize: ->
    LedgerWeb.app = new LedgerWeb.Models.Main()
    LedgerWeb.view = new LedgerWeb.Views.Main
      el: $('#ledger-web')
      model: @app
    LedgerWeb.view.render()

  nothing: =>
