var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  if(!req.session.signIned){
    var errorType=req.session.errorType;
    req.session.errorType=-1;
    res.render('index_unSignIn',{errorType:errorType});
    return;
  }
  req.con.query('SELECT * FROM userPassword WHERE user=?',req.session.user,function(err,rows){
    //user not exist
    res.render('index',{data:rows});
  });
});

module.exports = router;
