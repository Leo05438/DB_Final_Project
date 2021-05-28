var express = require('express');
var router = express.Router();

router.post('/register',function(req,res,next){
  if(req.session.signIned){
    res.redirect('/');
    return;
  }
  //illegal data
  if((!req.body.user)||(!req.body.password)||(!req.body.gender)||(!req.body.birth_date)||(req.body.gender!="Male"&&req.body.gender!="Female")){
    console.log('illegal data');
    req.session.errorType=0;
    res.redirect('/#register');
    return;
  }
  req.con.query('SELECT COUNT(*) AS n FROM UserList9 WHERE username=?',req.body.user,function(err,rows){
    //user exist
    if(rows[0].n!=0){
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
    console.log(Date());
    req.con.query('INSERT INTO userPassword SET ?',data,function(err,rows){
      data={
        username:req.body.user,
        user_id:0,
        user_watching:0,
        user_completed:0,
        user_onhold:0,
        user_dropped:0,
        user_plantowatch:0,
        user_days_spent_watching:0,
        gender:req.body.gender,
        location:0,
        birth_date:req.body.birth_date+" 00:00:00",
        access_rank:0,
        join_date:"2000-12-13",
        last_online:"2000-12-13",
        stats_mean_score:0,
        stats_rewatched:0,
        stats_episodes:0
      };
      req.con.query('INSERT INTO users_cleaned SET ?',data,function(err,rows){
        req.con.query('INSERT INTO UserList9 SET ?',data,function(err,rows){
          console.log('insert');
          req.session.signIned=true;
          req.session.user=req.body.user;
          res.redirect('/');
          return;
        });
      });
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
