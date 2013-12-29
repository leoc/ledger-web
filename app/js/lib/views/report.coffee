class LedgerWeb.Views.Report extends Backbone.View
  render: ->
    @$el.html("Now this is a nice report: #{@model.get('query')}")
    this
