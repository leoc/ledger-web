class window.LedgerWeb.BalanceView extends Backbone.View
  className: 'balance'
  
  initialize: ->
    @model.on 'change', =>
      @render()

  render: ->
    $(@el).html ""
    if @model.get('accounts')?
      for account in @model.get('accounts')
        $(@el).append JST['_balance'](account: account)
    this