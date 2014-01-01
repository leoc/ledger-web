LedgerWeb.Views.Report ||= {}
LedgerWeb.Views.Report.Visualization ||= {}

class LedgerWeb.Views.Report.Visualization.BalanceText extends Backbone.View
  accountTemplate: JST['report/visualization/balance_text/account']
  className: 'balance-text'

  initialize: ->
    @model.on 'sync', @renderData

  renderData: =>
    console.log @model.get('data')
    for account in @model.get('data').accounts
      @$el.append(@accountTemplate(account: account))

  render: =>
    @renderData() if @model.get('fetched')
    this
