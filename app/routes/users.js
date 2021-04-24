var express = require('express');
var router = express.Router();

router.get('/register', function(req, res, next) {
  res.render('users/register');
});
router.get('/signIn', function(req, res, next) {
  res.render('users/signIn');
});

module.exports = router;
