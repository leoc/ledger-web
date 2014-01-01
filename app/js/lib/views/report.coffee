class LedgerWeb.Views.Report extends Backbone.View
  render: ->
    @reportView = null

    if @model.get('type') == 'balance'
      @reportView = new LedgerWeb.Views.Report.Balance
        model: @model
      @$el.html(@reportView.render().el) if @reportView?
    else
      @$el.html("Other reports #{@model.get('query')}")
    this
