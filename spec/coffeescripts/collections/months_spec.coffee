describe 'LedgerWeb.Collections.Months', ->
  it 'contains Transaction models', ->
    months = new LedgerWeb.Collections.Months [ month: '2013/12' ]
    (expect months.first() instanceof LedgerWeb.Models.Transactions.Month).toBeTruthy()
