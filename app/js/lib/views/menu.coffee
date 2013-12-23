class LedgerWeb.Views.Menu extends Backbone.View
  template: JST['menu']
  reportLinkTemplate: JST['menu_report_link']

  events:
    'click ul.reports li': 'showReport'

  showReport: (e) =>
    LedgerWeb.app.set
      showReport: $(e.currentTarget).data('report')
      showMenu: false

  render: ->
    @$el.html(@template())
    @$reports = @$el.find('.reports')
    @model.reports.each (report) =>
      @$reports.append @reportLinkTemplate
        report: report.toJSON()
        index: @model.reports.indexOf(report)
    this
