describe 'LedgerWeb.Models.Transaction', ->
  it 'populates posts attribute as posts collection', ->
    transaction = new LedgerWeb.Models.Transaction
      posts: [account: 'Assets:Cash', amount: {}]
    (expect transaction.get('posts') instanceof LedgerWeb.Collections.Posts).toBeTruthy()

  it 'parses the date strings into javascript dates', ->
    tx = new LedgerWeb.Models.Transaction
      date: '2013/12/14'
    date = tx.get('date')
    (expect date instanceof Date).toBeTruthy()
    (expect date.getDate()).toEqual(14)
    (expect date.getMonth()).toEqual(11)
    (expect date.getFullYear()).toEqual(2013)

  it 'parses the effective date strings into javascript dates', ->
    tx = new LedgerWeb.Models.Transaction
      effective_date: '2013/12/16'
    date = tx.get('effective_date')
    (expect date instanceof Date).toBeTruthy()
    (expect date.getDate()).toEqual(16)
    (expect date.getMonth()).toEqual(11)
    (expect date.getFullYear()).toEqual(2013)

  describe 'losing assets', ->
    it 'returns the lost amount', ->
      tx = new LedgerWeb.Models.Transaction
        posts: [
          { account: "Expenses:Groceries", amount:   2.50, commodity: 'EUR' },
          { account: "Expenses:Cafe",      amount:   7.50, commodity: 'EUR' },
          { account: "Assets:Cash",        amount: -10.00, commodity: 'EUR' }
          ]
      (expect tx.getEffect()).toEqual [{ amount: -10.00, commodity: 'EUR' }]

  describe 'gaining assets', ->
    it 'returns the gained amount', ->
      tx = new LedgerWeb.Models.Transaction
        posts: [
          { account: "Assets:Cash",    amount:  10.00, commodity: 'EUR' },
          { account: "Income:Invoice", amount: -10.00, commodity: 'EUR' }
          ]
      (expect tx.getEffect()).toEqual [{ amount: 10.00, commodity: 'EUR'}]

  describe 'keeping assets', ->
    it 'returns zero for transaction between liabilities and assets', ->
      tx = new LedgerWeb.Models.Transaction
        posts: [
          { account: "Liabilities:Hans Moleman", amount:  10.00, commodity: 'EUR' },
          { account: "Assets:Cash",              amount: -10.00, commodity: 'EUR' }
          ]
      (expect tx.getEffect()).toEqual []
