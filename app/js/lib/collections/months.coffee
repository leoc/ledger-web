class LedgerWeb.Collections.Months extends Backbone.Collection
  model: LedgerWeb.Models.Transactions.Month

  comparator: (model) ->
    -model.get('beginning').valueOf()
