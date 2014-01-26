LedgerWeb.Models.Transactions ||= {}

class LedgerWeb.Models.Transactions.Post extends Backbone.Model
  initialize: ->
    if @get('date')?
      [year, month, date] = _.map(@get('date').split('/'), (val) -> parseInt(val, 10))
      @set date: new Date(year, month-1, date) #months are 0-based
    if @get('effective_date')?
      [year, month, date] = _.map(@get('effective_date').split('/'), (val) -> parseInt(val, 10))
      @set effective_date: new Date(year, month-1, date) #months are 0-based
