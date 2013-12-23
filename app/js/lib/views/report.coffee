class LedgerWeb.Views.Report extends Backbone.View
  template: JST['report']

  events:
    'click .menu': 'showMenu'
    'click .capture': 'captureTransaction'

  showMenu: =>
    console.log 'Show menu'
    LedgerWeb.app.set(showMenu: true)

  captureTransaction: =>

  render: ->
    @$el.html(@template(report: @model.toJSON()))
    if @model.get('reports').isEmpty()
      # render the correct report view
    else
      @tabsView = new LedgerWeb.Views.Report.Tabs
        model: @model
        el: $('.report-content')
    this
