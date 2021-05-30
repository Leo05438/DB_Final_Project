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

router.post('/add_comment',function(req,res,next){
  if(!req.session.signIned){
    res.redirect('/');
    return;
  }
  //illegal data
  if((!req.body.anime_id)||(!req.body.episodes)||(!req.body.status)||(!req.body.score)){
    console.log('illegal data');
    req.session.errorType=0;
    res.redirect("#add_comment_2"+req.body.anime_id);
    return;
  }
  req.con.query('SELECT COUNT(*) AS n FROM comment WHERE username=? AND anime_id=?',[req.session.user,req.body.anime_id],function(err,rows){
    //user exist
    if(rows[0].n!=0){
      console.log('comment exist');
      req.session.errorType=1;
      res.redirect('/#comment');
      return;
    }
    //insert
    var data={
      username:req.session.user,
      anime_id:req.body.anime_id,
      anime_name:req.body.anime_name,
      episodes:req.body.episodes,
      start_date:"2000-12-13",
      finish_date:"2000-12-13",
      score:req.body.score,
      status:req.body.status,
      rewatching:0,
      rewatching_ep:0,
      last_updated_9:0,
      last_updated_c:"2000-12-13 00:00:00",
      tags:0
    };
    req.con.query('INSERT INTO comment SET ?',data,function(err,rows){
      var data={
        username:req.session.user,
        anime_id:req.body.anime_id,
        my_watch_episodes:req.body.episodes,
        my_start_date:"2000-12-13",
        my_finish_date:"2000-12-13",
        my_score:req.body.score,
        my_status:req.body.status,
        my_rewatching:0,
        my_rewatching_ep:0,
        my_last_updated:"2000-12-13 00:00:00",
        my_tags:0
      };
      req.con.query('INSERT INTO animelist_cleaned SET ?',data,function(err,rows){
        req.con.query('SELECT * FROM users_cleaned WHERE username=?',req.session.user,function(err,rows){
          var n=rows[0].user_watching+rows[0].user_completed+rows[0].user_onhold+rows[0].user_dropped+rows[0].user_plantowatch;
          var w=0,c=0,o=0,p=0;
          if(req.body.status==1){
            w=1;
          }
          else if(req.body.status==2){
            c=1;
          }
          else if(req.body.status==3){
            o=1;
          }
          else if(req.body.status==6){
            p=1;
          }
          console.log(rows[0].stats_episodes);
          console.log(req.body.episodes);
          var data={
            username:rows[0].username,
            user_id:0,
            user_watching:rows[0].user_watching+w,
            user_completed:rows[0].user_completed+c,
            user_onhold:rows[0].user_onhold+o,
            user_dropped:rows[0].user_dropped,
            user_plantowatch:rows[0].user_plantowatch+p,
            user_days_spent_watching:0,
            gender:rows[0].gender,
            location:0,
            birth_date:rows[0].birth_date,
            access_rank:0,
            join_date:"2000-12-13",
            last_online:"2000-12-13",
            stats_mean_score:rows[0].stats_mean_score*n/(n+1)+req.body.score/(n+1),
            stats_rewatched:0,
            stats_episodes:parseInt(rows[0].stats_episodes,10)+parseInt(req.body.episodes,10)
          };
          req.con.query('UPDATE users_cleaned SET ? WHERE username=?',[data,req.session.user],function(err,rows){
            req.con.query('UPDATE UserList9 SET ? WHERE username=?',[data,req.session.user],function(err,rows){
              console.log('insert');
              res.redirect('/#comment');
              return;
            });
          });
        });
      });
    });
  });
});

router.post('/edit_comment',function(req,res,next){
  //console.log(req.body);
  if(req.body.submit=="delete"){
    req.con.query('DELETE FROM comment WHERE username=? AND anime_id=?',[req.session.user,req.body.anime_id],function(err,rows){
      req.con.query('DELETE FROM animelist_cleaned WHERE username=? AND anime_id=?',[req.session.user,req.body.anime_id],function(err,rows){
        req.con.query('SELECT * FROM users_cleaned WHERE username=?',req.session.user,function(err,rows){
          var n=rows[0].user_watching+rows[0].user_completed+rows[0].user_onhold+rows[0].user_dropped+rows[0].user_plantowatch;
          var w=0,c=0,o=0,d=0,p=0;
          if(req.body.status_o==1){
            w=-1;
          }
          else if(req.body.status_o==2){
            c=-1;
          }
          else if(req.body.status_o==3){
            o=-1;
          }
          else if(req.body.status_o==4){
            d=-1;
          }
          else if(req.body.status_o==6){
            p=-1;
          }
          var data={
            username:rows[0].username,
            user_id:0,
            user_watching:rows[0].user_watching+w,
            user_completed:rows[0].user_completed+c,
            user_onhold:rows[0].user_onhold+o,
            user_dropped:rows[0].user_dropped+d,
            user_plantowatch:rows[0].user_plantowatch+p,
            user_days_spent_watching:0,
            gender:rows[0].gender,
            location:0,
            birth_date:rows[0].birth_date,
            access_rank:0,
            join_date:"2000-12-13",
            last_online:"2000-12-13",
            stats_mean_score:rows[0].stats_mean_score*n/(n-1)-req.body.score_o/(n-1),
            stats_rewatched:0,
            stats_episodes:rows[0].stats_episodes-req.body.episodes_o
          };
          req.con.query('UPDATE users_cleaned SET ? WHERE username=?',[data,req.session.user],function(err,rows){
            req.con.query('UPDATE UserList9 SET ? WHERE username=?',[data,req.session.user],function(err,rows){
              console.log('DELETE');
              res.redirect('/#comment');
              return;
            });
          });
        });
      });
    });
  }
  else{
    var data={
      username:req.session.user,
      anime_id:req.body.anime_id,
      anime_name:req.body.anime_name,
      episodes:req.body.episodes,
      start_date:"2000-12-13",
      finish_date:"2000-12-13",
      score:req.body.score,
      status:req.body.status,
      rewatching:0,
      rewatching_ep:0,
      last_updated_9:0,
      last_updated_c:"2000-12-13 00:00:00",
      tags:0
    };
    req.con.query('UPDATE comment SET ? WHERE username=? AND anime_id=?',[data,req.session.user,req.body.anime_id],function(err,rows){
      var data={
        username:req.session.user,
        anime_id:req.body.anime_id,
        my_watch_episodes:req.body.episodes,
        my_start_date:"2000-12-13",
        my_finish_date:"2000-12-13",
        my_score:req.body.score,
        my_status:req.body.status,
        my_rewatching:0,
        my_rewatching_ep:0,
        my_last_updated:"2000-12-13 00:00:00",
        my_tags:0
      };
      req.con.query('UPDATE animelist_cleaned SET ? WHERE username=? AND anime_id=?',[data,req.session.user,req.body.anime_id],function(err,rows){
        req.con.query('SELECT * FROM users_cleaned WHERE username=?',req.session.user,function(err,rows){
          var n=rows[0].user_watching+rows[0].user_completed+rows[0].user_onhold+rows[0].user_dropped+rows[0].user_plantowatch;
          var w=0,c=0,o=0,d=0,p=0;
          if(req.body.status==1){
            w=1;
          }
          else if(req.body.status==2){
            c=1;
          }
          else if(req.body.status==3){
            o=1;
          }
          else if(req.body.status==4){
            d=1;
          }
          else if(req.body.status==6){
            p=1;
          }
          var w_o=0,c_o=0,o_o=0,d_o=0,p_o=0;
          if(req.body.status_o==1){
            w_o=-1;
          }
          else if(req.body.status_o==2){
            c_o=-1;
          }
          else if(req.body.status_o==3){
            o_o=-1;
          }
          else if(req.body.status_o==4){
            d_o=-1;
          }
          else if(req.body.status_o==6){
            p_o=-1;
          }
          var data={
            username:rows[0].username,
            user_id:0,
            user_watching:rows[0].user_watching+w+w_o,
            user_completed:rows[0].user_completed+c+c_o,
            user_onhold:rows[0].user_onhold+o+o_o,
            user_dropped:rows[0].user_dropped+d+d_o,
            user_plantowatch:rows[0].user_plantowatch+p+p_o,
            user_days_spent_watching:0,
            gender:rows[0].gender,
            location:0,
            birth_date:rows[0].birth_date,
            access_rank:0,
            join_date:"2000-12-13",
            last_online:"2000-12-13",
            stats_mean_score:rows[0].stats_mean_score-req.body.score_o/n+req.body.score/n,
            stats_rewatched:0,
            stats_episodes:parseInt(rows[0].stats_episodes,10)-parseInt(req.body.episodes_o,10)+parseInt(req.body.episodes,10)
          };
          req.con.query('UPDATE users_cleaned SET ? WHERE username=?',[data,req.session.user],function(err,rows){
            req.con.query('UPDATE UserList9 SET ? WHERE username=?',[data,req.session.user],function(err,rows){
              console.log('EDIT');
              res.redirect('/#comment');
              return;
            });
          });
        });
      });
    });
  }
});

module.exports = router;
