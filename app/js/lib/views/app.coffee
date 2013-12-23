class LedgerWeb.Views.App extends Backbone.View
  template: JST['app']

  events:
    'click #blocking-layer': 'hideMenu'

  hideMenu: =>
    @model.set(showMenu: false)

  initialize: ->
    @model.on('change showMenu', @toggleShowMenuClass)
    @model.on('change showReport', @renderReport)

  toggleShowMenuClass: =>
    @$el.toggleClass('show-menu', @model.get('showMenu'))

  renderReport: =>
    @$content ||= @$el.find('#content')
    @reportView = new LedgerWeb.Views.Report
      model: @model.currentReport()
      el: @$content
    @reportView.render()

  render: ->
    @$el.html(@template())
    @menuView = new LedgerWeb.Views.Menu
      model: @model
      el: @$el.find('#side-menu')
    @menuView.render()
    @renderReport()
    @toggleShowMenuClass()
    this
