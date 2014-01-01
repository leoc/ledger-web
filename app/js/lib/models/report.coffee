class LedgerWeb.Models.Report extends Backbone.Model
  defaults:
    fetched: false

  url: =>
    "/api/#{@get('resource')}?query=#{encodeURIComponent(@interpolateQuery())}"

  interpolateQuery: ->
    query = _.clone(@get('query'))
    for parameter, value of @get('parameters')
      query = query.replace "{{#{parameter}}}", value
    query

  parse: (data, options) =>
    { data: data }

  fetch: (options) ->
    if @get('reports').isEmpty()
      Backbone.Model.prototype.fetch.call(this, options);
    else
      @get('reports').each (report) ->
        report.fetch()

  initialize: ->
    @set
      fetched: !_.isEmpty(@get('reports'))
      reports: new LedgerWeb.Collections.Reports(@get('reports'))
