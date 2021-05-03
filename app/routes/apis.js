var express = require('express');
var router = express.Router();

router.post('/register',function(req,res,next){
  if(req.session.signIned){
    res.redirect('/');
    return;
  }
  //illegal data
  if((!req.body.user)||(!req.body.password)){
    console.log('illegal data');
    req.session.errorType=0;
    res.redirect('/#register');
    return;
  }
  req.con.query('SELECT COUNT(*) AS n FROM userPassword WHERE user=?',req.body.user,function(err,rows){
    //user exist
    if(rows[0].n==1){
      console.log('user exist');
      req.session.errorType=1;
      res.redirect('/#register');
      return;
    }
    //insert
    var data={
      user:req.body.user,
      password:req.body.password
    };
    req.con.query('INSERT INTO userPassword SET ?',data,function(err,rows){
      console.log('insert');
      req.session.signIned=true;
      req.session.user=req.body.user;
      res.redirect('/');
      return;
    });
  });
});

router.post('/signIn',function(req,res,next){
  if(req.session.signIned){
    res.redirect('/');
    return;
  }
  //illegal data
  if((!req.body.user)||(!req.body.password)){
    console.log('illegal data');
    req.session.errorType=2;
    res.redirect('/#signIn');
    return;
  }
  req.con.query('SELECT COUNT(*) AS n FROM userPassword WHERE user=?',req.body.user,function(err,rows){
    //user not exist
    if(rows[0].n==0){
      console.log('user not exist');
      req.session.errorType=3;
      res.redirect('/#register');
      return;
    }
    req.con.query('SELECT password FROM userPassword WHERE user=?',req.body.user,function(err,rows){
      //wrong password
      if(rows[0].password!=req.body.password){
        console.log('wrong password');
        req.session.errorType=4;
        res.redirect('/#signIn');
        return;
      }
      //signIn
      else{
        console.log('signIn');
        req.session.signIned=true;
        req.session.user=req.body.user;
        res.redirect('/');
        return;
      }
    });
  });
});

router.post('/signOut',function(req,res,next){
  if(req.body.no!="No"){
    req.session.signIned=false;
  }
  res.redirect('/');
});

module.exports = router;
