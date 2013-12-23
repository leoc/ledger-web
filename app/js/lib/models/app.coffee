class LedgerWeb.Models.App extends Backbone.Model
  defaults:
    showReport: 0
    showMenu: false

  initialize: (reports) ->
    @reports = new LedgerWeb.Collections.Reports _.map reports, (report) =>
      new LedgerWeb.Models.Report(report)

  currentReport: ->
    @reports.at(@get('showReport'))
