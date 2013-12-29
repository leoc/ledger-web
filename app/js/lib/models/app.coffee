class LedgerWeb.Models.App extends Backbone.Model
  defaults:
    showReport: 0
    showMenu: false

  initialize: (reports) ->
    @reports = new LedgerWeb.Collections.Reports(reports)

  currentReport: ->
    @reports.at(@get('showReport'))
