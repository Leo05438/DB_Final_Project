var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  if(!req.session.signIned){
    var errorType=req.session.errorType;
    req.session.errorType=-1;
    res.render('index_unSignIn',{errorType:errorType});
    return;
  }
  res.render('index',{title:'Express'});
});

module.exports = router;
