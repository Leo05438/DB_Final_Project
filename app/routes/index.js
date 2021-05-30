var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  if(!req.session.signIned){
    var errorType=req.session.errorType;
    req.session.errorType=-1;
    res.render('index_unSignIn',{errorType:errorType});
    return;
  }
  req.con.query('SELECT * FROM userPassword WHERE user=?',req.session.user,function(err,password){
    req.con.query('SELECT * FROM users_cleaned WHERE username=?',req.session.user,function(err,user){
      req.con.query('SELECT Japanese_name name,MAL_ID id FROM anime',function(err,anime){
        req.con.query('SELECT * FROM comment WHERE username=?',req.session.user,function(err,comment){
          var errorType=req.session.errorType;
          req.session.errorType=-1;
          res.render('index',{password:password,user:user,anime:anime,errorType:errorType,comment:comment});
        });
      });
    });
  });
});

router.get('/test', function(req, res, next) {
  if(!req.session.signIned){
    var errorType=req.session.errorType;
    req.session.errorType=-1;
    res.render('index_unSignIn',{errorType:errorType});
    return;
  }
  res.render('test');
  return;
});

module.exports = router;
