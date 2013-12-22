class LedgerWeb.Router extends Backbone.Router
  routes:
    '': 'nothing'

  initialize: ->
    LedgerWeb.app = new LedgerWeb.Models.App()
    LedgerWeb.view = new LedgerWeb.Views.App
      el: $('#ledger-web')
      model: LedgerWeb.app
    LedgerWeb.view.render()

  nothing: =>
