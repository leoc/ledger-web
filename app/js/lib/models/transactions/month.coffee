LedgerWeb.Models.Transactions ||= {}

class LedgerWeb.Models.Transactions.Month extends Backbone.Model
  initialize: ->
    @set transactions: new LedgerWeb.Collections.Transactions(@get('transactions'))
