class LedgerWeb.Models.App extends Backbone.Model
  defaults:
    showReports: null
    showMenu: true

  initialize: (reports) ->
    @reports = new LedgerWeb.Collections.Reports _.map reports, (report) =>
      new LedgerWeb.Models.Report(report)
