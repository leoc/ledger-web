describe 'LedgerWeb.Models.Month', ->
  it 'populates transactions attribute as transactions collection', ->
    month = new LedgerWeb.Models.Transactions.Month
      month: '2013/12'
      transactions: [payee: 'my payee']
    (expect month.get('transactions') instanceof LedgerWeb.Collections.Transactions).toBeTruthy()
