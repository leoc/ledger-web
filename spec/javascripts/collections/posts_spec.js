(function() {

  describe('LedgerWeb.Collections.Posts', function() {
    return it('contains Post models', function() {
      var posts;
      posts = new LedgerWeb.Collections.Posts([
        {
          foo: 'bar'
        }
      ]);
      return (expect(posts.first() instanceof LedgerWeb.Models.Transactions.Post)).toBeTruthy();
    });
  });

}).call(this);
