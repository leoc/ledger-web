 $(document).ready ->
   LedgerWeb.router = new LedgerWeb.Router()
   Backbone.history.start
     pushState: true
