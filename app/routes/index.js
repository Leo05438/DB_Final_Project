var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  if(!req.session.signIned){
    res.redirect('/users/signIn');
  }
  else{
    res.render('index',{title:'Express'});
  }
});

module.exports = router;
