describe 'LedgerWeb.Models.Transactions.Post', ->
  it 'parses the date strings into javascript dates', ->
    post = new LedgerWeb.Models.Transactions.Post
      date: '2013/12/14'
    date = post.get('date')
    (expect date instanceof Date).toBeTruthy()
    (expect date.getDate()).toEqual(14)
    (expect date.getMonth()).toEqual(11)
    (expect date.getFullYear()).toEqual(2013)

  it 'parses the effective date strings into javascript dates', ->
    post = new LedgerWeb.Models.Transactions.Post
      effective_date: '2013/12/16'
    date = post.get('effective_date')
    (expect date instanceof Date).toBeTruthy()
    (expect date.getDate()).toEqual(16)
    (expect date.getMonth()).toEqual(11)
    (expect date.getFullYear()).toEqual(2013)
