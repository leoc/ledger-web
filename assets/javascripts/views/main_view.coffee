class window.LedgerWeb.MainView extends Backbone.View
  id: 'ledger_web'
  template: JST['ledger_web']

  initialize: ->
    @balance_view = new LedgerWeb.BalanceView model: app.balance
    @register_view = new LedgerWeb.RegisterView model: app.register
    @statistics_view = new LedgerWeb.StatisticsView
    
    @model.on 'change:current', =>
      $(@el).removeClass('balance register statistics').addClass(@model.get('current'))
  
  render: ->
    $(@el).removeClass('balance register statistics').addClass(@model.get('current'))
    $(@el).html(@template())
    $(@el).find('.viewport').append @balance_view.render().el
    $(@el).find('.viewport').append @register_view.render().el
    $(@el).find('.viewport').append @statistics_view.render().el
    this