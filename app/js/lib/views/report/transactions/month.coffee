LedgerWeb.Views.Transactions ||= {}

class LedgerWeb.Views.Transactions.Month extends Backbone.View
  template: JST['report/transactions/month']

  className: 'month'

  options:
    collapsed: true

  events:
    'click > .info': 'expandOrCollapse'

  expandOrCollapse: =>
    @options.collapsed = not @options.collapsed
    @updateCollapsedState()

  updateCollapsedState: =>
    @$el.toggleClass('collapsed', @options.collapsed)

  render: =>
    @$el.html(@template(month: @model.toJSON()))
    @$transactions = @$el.find('.transactions')
    @model.get('transactions').each (transaction) =>
      view = new LedgerWeb.Views.Transactions.Transaction
        model: transaction
      @$transactions.append(view.render().el)
    @updateCollapsedState()
    this
