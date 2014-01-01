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
