class window.LedgerWeb.CaptureView extends Backbone.View
  id: 'capture'
  template: JST['capture']
  
  initialize: ->
    

  render: ->
    $(@el).html @template()
    this