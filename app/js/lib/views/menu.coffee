class LedgerWeb.Views.Menu extends Backbone.View
  template: JST['menu']
  reportLinkTemplate: JST['menu/report_link']

  render: ->
    @$el.html(@template())
    @$reports = @$el.find('.reports')
    @model.reports.each (report) =>
      @$reports.append(@reportLinkTemplate(report: report.toJSON()))
    this
