class LedgerWeb.Models.Transaction extends Backbone.Model
  initialize: ->
    @set posts: new LedgerWeb.Collections.Posts(@get('posts'))
