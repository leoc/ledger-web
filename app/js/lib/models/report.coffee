class LedgerWeb.Models.Report extends Backbone.Model
  defaults:
    fetched: false

  initialize: ->
    @set
      fetched: !_.isEmpty(@get('reports'))
      reports: new LedgerWeb.Collections.Reports(@get('reports'))
