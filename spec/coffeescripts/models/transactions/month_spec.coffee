describe 'LedgerWeb.Models.Transactions.Month', ->
  it 'populates transactions attribute as transactions collection', ->
    month = new LedgerWeb.Models.Transactions.Month
      month: '2013/12'
      transactions: [payee: 'my payee', date: '2013/12/01']
    (expect month.get('transactions') instanceof LedgerWeb.Collections.Transactions).toBeTruthy()

  it 'parses the date strings into javascript dates', ->
    month = new LedgerWeb.Models.Transactions.Month
      month: '2013/12'
    beginning = month.get('beginning')
    (expect beginning instanceof Date).toBeTruthy()
    (expect beginning.getDate()).toEqual(1)
    (expect beginning.getMonth()).toEqual(11)
    (expect beginning.getFullYear()).toEqual(2013)
