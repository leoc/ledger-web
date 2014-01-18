(function() {

  describe('LedgerWeb.Collections.Months', function() {
    return it('contains Transaction models', function() {
      var months;
      months = new LedgerWeb.Collections.Months([
        {
          month: '2013/12'
        }
      ]);
      return (expect(months.first() instanceof LedgerWeb.Models.Transactions.Month)).toBeTruthy();
    });
  });

}).call(this);
