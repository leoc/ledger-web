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

window.monthAsString = (date) ->
  months = ['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  "#{months[date.getMonth()]} #{date.getFullYear()}"

window.dateAsString = (date) ->
  daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
  lastDigit = date.getDate()%10
  suffix = switch
    when lastDigit == 1 then 'st'
    when lastDigit == 2 then 'nd'
    when lastDigit == 3 then 'rd'
    else 'th'
  "#{daysOfWeek[date.getDay()]}, #{date.getDate()}#{suffix}"

Date::daysInMonth = () ->
  d = new Date(@getFullYear(), @getMonth()+1, 0)
  d.getDate()

window.formatCurrency = (value) ->
  "#{value.toFixed(2)}"

window.effectString = (effects) ->
  for effect in effects
    "#{formatCurrency(effect.amount)} #{effect.commodity}"
