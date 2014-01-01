LedgerWeb.Views.Report ||= {}

class LedgerWeb.Views.Report.Balance extends Backbone.View
  className: 'balance-report'

  visualization: 'balance_text'

  availableVisualizations: ->
    visualizations = ['balance_text']
    # if all accounts positive or all negative, allow 'sunburst_chart'
    # if some accounts positive and some accounts negative, allow 'bar_chart'
    visualizations

  render: ->
    @view = null

    if @visualization == 'balance_text'
      @view = new LedgerWeb.Views.Report.Visualization.BalanceText
        model: @model

    @$el.html(@view.render().el)
    this
