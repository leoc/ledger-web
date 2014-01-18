(function() {

  describe('LedgerWeb.Collections.Transactions', function() {
    it('contains Transaction models', function() {
      var transactions;
      transactions = new LedgerWeb.Collections.Transactions([
        {
          a: '1'
        }
      ]);
      return (expect(transactions.first() instanceof LedgerWeb.Models.Transaction)).toBeTruthy();
    });
    return describe('#extractMonths', function() {
      return it('returns a LedgerWeb.Collections.Months with transactions grouped by month', function() {
        var extractedMonths, transactions;
        transactions = new LedgerWeb.Collections.Transactions([
          {
            date: '2014/01/01',
            payee: 'Foo'
          }, {
            date: '2013/12/30',
            payee: 'Bar'
          }
        ]);
        extractedMonths = transactions.extractMonths();
        (expect(extractedMonths.map(function(month) {
          return month.get('month');
        }))).toContain('2014/01');
        return (expect(extractedMonths.map(function(month) {
          return month.get('month');
        }))).toContain('2013/12');
      });
    });
  });

}).call(this);
