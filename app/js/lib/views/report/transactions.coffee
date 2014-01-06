LedgerWeb.Views.Report ||= {}

class LedgerWeb.Views.Report.Transactions extends Backbone.View
  className: 'transactions report'

  template: JST['report/transactions']

  initialize: ->
    @model.on 'sync', @renderData

  renderData: =>
    console.log @model.get('data')
    @$el.html(@template(transactions: @model.get('data')))
    this

  render: =>
    @renderData() if @model.get('fetched')
    this
