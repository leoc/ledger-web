LedgerWeb.Views.Report ||= {}
LedgerWeb.Views.Report.Visualization ||= {}

class LedgerWeb.Views.Report.Visualization.Budget extends Backbone.View
  template: JST['report/visualization/budget']
  className: 'budget-chart'

  initialize: ->
    @model.on 'sync', @renderData

  renderData: =>
    console.log @model.get('data')
    @$el.append(@template(accounts: @model.get('data').accounts))

  render: =>
    @renderData() if @model.get('fetched')
    this
