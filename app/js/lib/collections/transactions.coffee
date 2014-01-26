class LedgerWeb.Collections.Transactions extends Backbone.Collection
  model: LedgerWeb.Models.Transaction

  months: []

  initialize: ->
    @on 'reset', @extractMonths

  extractMonths: =>
    groups = @groupBy (transaction) =>
      "#{transaction.get('date').getFullYear()}/#{('0' + (transaction.get('date').getMonth()+1)).slice(-2)}"
    @months = new LedgerWeb.Collections.Months _.map groups, (val, key) =>
      month: key
      transactions: val

  getMonths: ->
    @months
