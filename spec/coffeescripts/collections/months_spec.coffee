describe 'LedgerWeb.Collections.Months', ->
  it 'contains Transaction models', ->
    months = new LedgerWeb.Collections.Months [ month: '2013/12' ]
    (expect months.first() instanceof LedgerWeb.Models.Transactions.Month).toBeTruthy()

  it 'sorts the months by date (latest to oldest)', ->
    jan2014 = new LedgerWeb.Models.Transactions.Month month: '2014/01'
    dec2013 = new LedgerWeb.Models.Transactions.Month month: '2013/12'
    oct2013 = new LedgerWeb.Models.Transactions.Month month: '2013/10'
    months = new LedgerWeb.Collections.Months [oct2013, jan2014, dec2013]
    (expect months.at(0).get('month')).toEqual('2014/01')
    (expect months.at(1).get('month')).toEqual('2013/12')
    (expect months.at(2).get('month')).toEqual('2013/10')
