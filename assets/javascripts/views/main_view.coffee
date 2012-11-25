class window.LedgerWeb.MainView extends Backbone.View
  id: 'main'
  template: JST['ledger_web']

  # events:
  #   'swipe': 'swipe_tabs'
  #   'drag': 'drag'
  #   'dragend': 'drag'
  #   'dragstart': 'drag'

  initialize: ->
    @balance_view = new LedgerWeb.BalanceView model: app.balance
    @register_view = new LedgerWeb.RegisterView model: app.register
    @statistics_view = new LedgerWeb.StatisticsView

    @model.on 'change:current', @update_current_tab

  swipe_tabs: (e) ->
    tabs = [ 'balance', 'register', 'statistics' ]
    current_index = tabs.indexOf(app.get('current'))
    if e.direction is "right"
      if current_index > 0
        Backbone.history.navigate(tabs[current_index-1], true)
      
    if e.direction is "left"
      if current_index < (tabs.length-1)
        Backbone.history.navigate(tabs[current_index+1], true)

  update_current_tab: =>
    if @model.get('current')
      $(@el).removeClass('balance register statistics').addClass(@model.get('current'))
  
  render: ->
    @update_current_tab()
    $(@el).html(@template())
    $(@el).find('.viewport').append @balance_view.render().el
    $(@el).find('.viewport').append @register_view.render().el
    $(@el).find('.viewport').append @statistics_view.render().el
    this