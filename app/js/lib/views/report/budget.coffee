LedgerWeb.Views.Report ||= {}

class LedgerWeb.Views.Report.Budget extends Backbone.View
  className: 'budget report'

  render: ->
    @view = null

    @view = new LedgerWeb.Views.Report.Visualization.Budget
      model: @model

    @$el.html(@view.render().el)
    this
