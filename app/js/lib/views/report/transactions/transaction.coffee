LedgerWeb.Views.Transactions ||= {}

class LedgerWeb.Views.Transactions.Transaction extends Backbone.View
  template: JST['report/transactions/transaction']

  className: 'transaction'

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
    @$el.html(@template(transaction: @model.toJSON(), effect: @model.getEffect()))
    @$posts = @$el.find('.posts')
    @model.get('posts').each (post) =>
      view = new LedgerWeb.Views.Transactions.Post
        model: post
      @$posts.append(view.render().el)
    @updateCollapsedState()
    this
