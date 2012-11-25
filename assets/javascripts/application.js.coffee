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
  defaults:
    current: 'balance'

  initialize: ->
    @balance = new LedgerWeb.Balance()
    @register = new LedgerWeb.Register()

  capture_transaction: ->
    

class window.LedgerWeb.Router extends Backbone.Router
  routes:
    '': 'index'
    'balance': 'balance'
    'register': 'register'
    'statistics': 'statistics'
    'capture': 'capture'

  initialize: ->
    window.app = new LedgerWeb()
    window.view = new LedgerWeb.MainView
      model: app
    $('body').append(view.render().el)

  index: ->

  balance: ->
    app.set 'current', 'balance'
    
  register: ->
    app.set 'current', 'register'

  statistics: ->
    app.set 'current', 'statistics'

  capture: ->
    app.capture_transaction()
  
$(document).ready ->
  new LedgerWeb.Router()
  Backbone.history.start()
  
  if Backbone.history
    $('a').live 'click', (e) ->
      href = $(this).attr 'href'
      protocol = this.protocol + '//'
      if (href.slice(protocol.length) isnt protocol) and !(href.indexOf('/sessions/destroy') >= 0)
        e.preventDefault();
        Backbone.history.navigate(href, true)
