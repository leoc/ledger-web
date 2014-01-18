describe 'LedgerWeb.Collections.Transactions', ->
  it 'contains Transaction models', ->
    transactions = new LedgerWeb.Collections.Transactions [ date: '2013/12/01' ]
    (expect transactions.first() instanceof LedgerWeb.Models.Transaction).toBeTruthy()

  describe '#extractMonths', ->
    it 'returns a LedgerWeb.Collections.Months with transactions grouped by month', ->
      transactions = new LedgerWeb.Collections.Transactions [
        { date: '2014/01/01', payee: 'Foo' }
        { date: '2013/12/30', payee: 'Bar' }
        ]
      extractedMonths = transactions.extractMonths()
      (expect extractedMonths.map((month) -> month.get('month'))).toContain('2014/01')
      (expect extractedMonths.map((month) -> month.get('month'))).toContain('2013/12')
      extractedMonths.each (month) =>
        (expect month.get('transactions').map((t) -> t.get('payee')).toContain('Foo')
