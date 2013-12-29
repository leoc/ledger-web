LedgerWeb.Views.Report ||= {}

class LedgerWeb.Views.Report.Frame extends Backbone.View
  template: JST['report_frame']

  events:
    'click .menu': 'showMenu'
    'click .capture': 'captureTransaction'

  showMenu: =>
    LedgerWeb.app.set(showMenu: true)

  captureTransaction: =>
    alert('Not yet implemented!')

  render: ->
    @$el.html(@template(report: @model.toJSON()))
    if @model.get('reports').isEmpty()
      # render the correct report view
      @reportView = new LedgerWeb.Views.Report
        model: @model
        el: @$el.find('.report-content')
      @reportView.render()
    else
      @tabsView = new LedgerWeb.Views.Report.Tabs
        model: @model
        el: @$el.find('.report-content')
      @tabsView.render()
    this
