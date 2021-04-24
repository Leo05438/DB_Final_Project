var express = require('express');
var router = express.Router();

router.post('/register',function(req,res,next){
  //資料不完整
  if(req.session.signIned){
    res.redirect('/');
    return;
  }
  if((!req.body.user)||(!req.body.password)){
    console.log('資料不完整');
    res.redirect('/users/register');
    return;
  }
  //user重複
  req.con.query('SELECT COUNT(*) AS n FROM userPassword WHERE user=?',req.body.user,function(err,rows){
    if(rows[0].n==1){
      console.log('user重複');
      res.redirect('/users/register');
      return;
    }
    console.log('c3');
    //insert
    var data={
      user:req.body.user,
      password:req.body.password
    };
    req.con.query('INSERT INTO userPassword SET ?',data,function(err,rows){
      console.log('insert');
      req.session.signIned=true;
      res.redirect('/');
      return;
    });
  });
});

router.post('/signOut',function(req,res,next){
  req.session.signIned=false;
  res.redirect('/');
});

module.exports = router;
