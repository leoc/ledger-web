(function() {

  describe('LedgerWeb.Models.Transaction', function() {
    return it('populates posts attribute as posts collection', function() {
      var transaction;
      transaction = new LedgerWeb.Models.Transaction({
        posts: [
          {
            account: 'Assets:Cash',
            amount: {}
          }
        ]
      });
      return (expect(transaction.get('posts') instanceof LedgerWeb.Collections.Posts)).toBeTruthy();
    });
  });

}).call(this);
