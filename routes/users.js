(function() {
  var express, router;

  express = require("express");

  router = express.Router();

  router.get("/", function(req, res) {
    res.send("respond with a resource");
  });

  module.exports = router;

}).call(this);
