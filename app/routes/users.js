var express = require('express');
var router = express.Router();

router.get('/register', function(req, res, next) {
  if(req.session.signIned){
    res.redirect('/');
    return;
  }
  res.render('users/register');
});
router.get('/signIn', function(req, res, next) {
  if(req.session.signIned){
    res.redirect('/');
    return;
  }
  res.render('users/signIn');
});

module.exports = router;
