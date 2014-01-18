(function() {

  describe('LedgerWeb.Models.Month', function() {
    return it('populates transactions attribute as transactions collection', function() {
      var month;
      month = new LedgerWeb.Models.Transactions.Month({
        month: '2013/12',
        transactions: [
          {
            payee: 'my payee'
          }
        ]
      });
      return (expect(month.get('transactions') instanceof LedgerWeb.Collections.Transactions)).toBeTruthy();
    });
  });

}).call(this);
