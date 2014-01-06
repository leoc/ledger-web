window.LedgerWeb =
  Views: {}
  Models: {}
  Collections: {}

window.toClassName = (str) ->
  str.toLowerCase().replace(/[^a-zA-Z0-9\-]/, '-')

window.negPosClass = (val) ->
  if val > 0
    'pos'
  else
    'neg'

window.keptBudgetPercentage = (percentage) ->
  val = parseInt(percentage)
  if val > 100
    100 / val * 100
  else
    val

window.exceededBudgetPercentage = (percentage) ->
  val = parseInt(percentage)
  if val > 100
    (val - 100) / val * 100
  else
    0

window.progressOfCurrentMonth = () ->
  new Date().getDate() / (new Date().daysInMonth()) * 100

window.shortenAccountName = (name) ->
  parts = name.split(':')
  for part, i in parts
    if i < parts.length - 2
      parts[i] = part[0]
    else if i < parts.length - 2
      parts[i] = part[0..2]
  parts.join(':')

Date::daysInMonth = () ->
  d = new Date(@getFullYear(), @getMonth()+1, 0)
  d.getDate()
