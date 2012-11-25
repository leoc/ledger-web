#= require hammer
#= require jquery-1.8.3
#= require jquery.specialevent.hammer
#= require hamlcoffee
#= require underscore
#= require backbone
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views

window.app = {}

class window.LedgerWeb extends Backbone.Model
  initialize: ->
    @balance = new LedgerWeb.Balance()
    @register = new LedgerWeb.Register()

  update: ->
    today = new Date
    @balance.fetch()
    @register.fetch
      data:
        query: "--sort date --begin #{today.getFullYear()}/#{today.getMonth()}/#{today.getDate()}"

class window.LedgerWeb.Router extends Backbone.Router
  routes:
    '': 'index'
    'balance': 'balance'
    'register': 'register'
    'statistics': 'statistics'
    'capture': 'capture_transaction'

  initialize: ->
    window.app = new LedgerWeb()
    window.app.main_view = new LedgerWeb.MainView
      model: app
    $('#ledger_web').append(app.main_view.render().el)
    app.update()

  index: ->
    Backbone.history.navigate("/balance", true)

  balance: ->
    $('#ledger_web #capture').remove()
    app.set 'current', 'balance'
    
  register: ->
    $('#ledger_web #capture').remove()
    app.set 'current', 'register'

  statistics: ->
    $('#ledger_web #capture').remove()
    app.set 'current', 'statistics'

  capture_transaction: ->
    app.new_transaction = new LedgerWeb.Transaction()
    app.capture_view = new LedgerWeb.CaptureView model: app.new_transaction
    $('#ledger_web').append(app.capture_view.render().el)

$(document).ready ->
  new LedgerWeb.Router()
  Backbone.history.start()
  
  if Backbone.history
    $('a').live 'click', (e) ->
      href = $(this).attr 'href'
      protocol = this.protocol + '//'
      if (href.slice(protocol.length) isnt protocol) and href.indexOf("javascript:") != 0 and !(href.indexOf('/sessions/destroy') >= 0)
        e.preventDefault();
        Backbone.history.navigate(href, true)
