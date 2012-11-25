class window.LedgerWeb.RegisterView extends Backbone.View
  className: 'register'
  
  initialize: ->
    @model.on 'change', =>
      @render()
      
  render: ->
    $(@el).html ""
    if @model.get('transactions')
      for transaction in @model.get('transactions')
        $(@el).append JST['_transaction'](transaction: transaction)
    this