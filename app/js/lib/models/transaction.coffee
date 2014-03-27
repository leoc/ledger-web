class LedgerWeb.Models.Transaction extends Backbone.Model
  initialize: ->
    @set posts: new LedgerWeb.Collections.Posts(@get('posts'))
    if @get('date')?
      [year, month, date] = _.map(@get('date').split('/'), (val) -> parseInt(val, 10))
      @set date: new Date(year, month-1, date) #months are 0-based
    if @get('effective_date')?
      [year, month, date] = _.map(@get('effective_date').split('/'), (val) -> parseInt(val, 10))
      @set effective_date: new Date(year, month-1, date) #months are 0-based

  getEffect: ->
    groupedPosts = {}
    @get('posts').each (post) ->
      root = post.getRootAccount()
      commodity = post.get('commodity')
      groupedPosts[root] = {} unless groupedPosts[root]?
      groupedPosts[root][commodity] = [] unless groupedPosts[root][commodity]?
      groupedPosts[root][commodity].push post

    accounts = _.keys(groupedPosts)
    ret = []

    if ~accounts.indexOf('Expenses') # -> loss
      ret = for commodity, posts of groupedPosts['Expenses']
        {
          amount: -1 * _.reduce(posts, (memo, post) ->
            memo + post.get('amount')
          , 0),
          commodity: commodity
        }
    else if ~accounts.indexOf('Income') # -> gain
      ret = for commodity, posts of groupedPosts['Income']
        {
          amount: -1 * _.reduce(posts, (memo, post) ->
            memo + post.get('amount')
          , 0),
          commodity: commodity
        }
    ret
