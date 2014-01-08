LedgerWeb.Views.Transactions ||= {}

class LedgerWeb.Views.Transactions.Post extends Backbone.View
  template: JST['report/transactions/post']

  className: 'post'

  render: =>
    @$el.html(@template(post: @model.toJSON()))
    this
