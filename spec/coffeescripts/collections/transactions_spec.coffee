describe 'LedgerWeb.Collections.Transactions', ->
  it 'contains Transaction models', ->
    transactions = new LedgerWeb.Collections.Transactions [ date: '2013/12/01' ]
    (expect transactions.first() instanceof LedgerWeb.Models.Transaction).toBeTruthy()

  it 'sorts the transactions by date (latest to oldest)', ->
    first  = new LedgerWeb.Models.Transaction payee: 'first',  date: '2014/01/17'
    second = new LedgerWeb.Models.Transaction payee: 'second', date: '2013/12/10'
    third  = new LedgerWeb.Models.Transaction payee: 'third',  date: '2013/12/03'
    fourth = new LedgerWeb.Models.Transaction payee: 'fourth', date: '2013/10/12'
    txs = new LedgerWeb.Collections.Transactions [third, first, fourth, second]
    (expect txs.at(0).get('payee')).toEqual('first')
    (expect txs.at(1).get('payee')).toEqual('second')
    (expect txs.at(2).get('payee')).toEqual('third')
    (expect txs.at(3).get('payee')).toEqual('fourth')

  describe '#extractMonths', ->
    it 'returns a LedgerWeb.Collections.Months with transactions grouped by month', ->
      transactions = new LedgerWeb.Collections.Transactions [
        { date: '2014/01/01', payee: 'Foo' }
        { date: '2013/12/30', payee: 'Bar' }
        ]
      extractedMonths = transactions.extractMonths()
      (expect extractedMonths.map((month) -> month.get('month'))).toContain('2014/01')
      (expect extractedMonths.map((month) -> month.get('month'))).toContain('2013/12')
      (expect extractedMonths.at(0).get('transactions').at(0).get('payee')).toEqual('Foo')
      (expect extractedMonths.at(1).get('transactions').at(0).get('payee')).toEqual('Bar')
