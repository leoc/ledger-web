describe 'LedgerWeb.Collections.Posts', ->
  it 'contains Post models', ->
    posts = new LedgerWeb.Collections.Posts [ foo: 'bar' ]
    (expect posts.first() instanceof LedgerWeb.Models.Transactions.Post).toBeTruthy()
