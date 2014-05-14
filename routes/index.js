(function() {
  var express, passport, router;

  express = require("express");

  passport = require("passport");

  router = express.Router();

  router.get("/", function(req, res) {
    res.render("index", {
      title: "Hoowenware"
    });
  });

  router.get("/login", function(req, res) {
    res.render("login", {
      title: "Hoowenware"
    });
  });

  module.exports = router;

}).call(this);
