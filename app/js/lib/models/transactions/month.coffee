LedgerWeb.Models.Transactions ||= {}

class LedgerWeb.Models.Transactions.Month extends Backbone.Model
  initialize: ->
    @set transactions: new LedgerWeb.Collections.Transactions(@get('transactions'))
    [year, month] = _.map(@get('month').split('/'), (val) -> parseInt(val, 10))
    @set beginning: new Date(year, month-1, 1) #months are 0-based
