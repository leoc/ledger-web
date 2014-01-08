LedgerWeb.Views.Report ||= {}

class LedgerWeb.Views.Report.Transactions extends Backbone.View
  className: 'transactions report'

  template: JST['report/transactions']

  initialize: ->
    @model.on 'sync', @renderData

  renderData: =>
    @model.get('data').getMonths().each (month) =>
      view = new LedgerWeb.Views.Transactions.Month
        model: month
      @$el.append(view.render().el)
    this

  render: =>
    @renderData() if @model.get('fetched')
    this
