describe 'LedgerWeb.Models.Transaction', ->
  it 'populates posts attribute as posts collection', ->
    transaction = new LedgerWeb.Models.Transaction
      posts: [account: 'Assets:Cash', amount: {}]
    (expect transaction.get('posts') instanceof LedgerWeb.Collections.Posts).toBeTruthy()
