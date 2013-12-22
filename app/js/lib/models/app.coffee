class LedgerWeb.Models.App extends Backbone.Model
  defaults:
    report: null
    reports: null
    showMenu: false

  initialize: (reports) ->
    @reports = new LedgerWeb.Collections.Reports _.map reports, (report) =>
      new LedgerWeb.Models.Report(report)
