express  = require "express"
passport = require "passport"
router   = express.Router()

# GET home page.
router.get "/", (req, res) ->
  res.render "index",
    title: "Hoowenware"
  return

router.get "/login", (req, res) ->
  res.render "login",
    title: "Hoowenware"
  return



module.exports = router
