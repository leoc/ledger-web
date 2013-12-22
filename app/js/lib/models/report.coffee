class LedgerWeb.Models.Report extends Backbone.Model
  initialize: ->
    @set 'reports', new LedgerWeb.Collections.Reports(@get('reports'))
