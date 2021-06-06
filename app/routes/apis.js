var express = require('express');
var router = express.Router();
const url = require('url');

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
          var data={
            user_watching:rows[0].user_watching+w,
            user_completed:rows[0].user_completed+c,
            user_onhold:rows[0].user_onhold+o,
            user_plantowatch:rows[0].user_plantowatch+p,
            stats_mean_score:rows[0].stats_mean_score*n/(n+1)+req.body.score/(n+1),
            stats_episodes:parseInt(rows[0].stats_episodes,10)+parseInt(req.body.episodes,10)
          };
          req.con.query('UPDATE users_cleaned SET ? WHERE username=?',[data,req.session.user],function(err,rows){
            req.con.query('UPDATE UserList9 SET ? WHERE username=?',[data,req.session.user],function(err,rows){
              req.con.query('SELECT * FROM AnimeList9 WHERE anime_id=?',req.body.anime_id,function(err,rows){
                var data={
                	score:req.body.score/(rows[0].members+1)+rows[0].score,
                	members:rows[0].members+1
                };
                req.con.query('UPDATE AnimeList9 SET ? WHERE anime_id=?',[data,req.body.anime_id],function(err,rows){
                  req.con.query('SELECT * FROM anime WHERE MAL_ID=?',req.body.anime_id,function(err,rows){
                    var data={
                    	Score:req.body.score/(rows[0].Members+1)+rows[0].Score,
                    	Members:rows[0].Members+1,
                    	Watching:rows[0].Watching+w,
                    	Completed:rows[0].Completed+c,
                    	On_Hold:rows[0].On_Hold+o,
                    	Plan_to_Watch:rows[0].Plan_to_Watch+p,
                    	Score_10:rows[0].Score_10,
                    	Score_9:rows[0].Score_9,
                    	Score_8:rows[0].Score_8,
                    	Score_7:rows[0].Score_7,
                    	Score_6:rows[0].Score_6,
                    	Score_5:rows[0].Score_5,
                    	Score_4:rows[0].Score_4,
                    	Score_3:rows[0].Score_3,
                    	Score_2:rows[0].Score_2,
                    	Score_1:rows[0].Score_1
                    };
                    if(req.body.score==1){
                      data.Score_1+=1;
                    }
                    else if(req.body.score==2){
                      data.Score_2+=1;
                    }
                    else if(req.body.score==3){
                      data.Score_3+=1;
                    }
                    else if(req.body.score==4){
                      data.Score_4+=1;
                    }
                    else if(req.body.score==5){
                      data.Score_5+=1;
                    }
                    else if(req.body.score==6){
                      data.Score_6+=1;
                    }
                    else if(req.body.score==7){
                      data.Score_7+=1;
                    }
                    else if(req.body.score==8){
                      data.Score_8+=1;
                    }
                    else if(req.body.score==9){
                      data.Score_9+=1;
                    }
                    else if(req.body.score==10){
                      data.Score_10+=1;
                    }
                    req.con.query('UPDATE anime SET ? WHERE MAL_ID=?',[data,req.body.anime_id],function(err,rows){
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
      });
    });
  });
});

router.post('/edit_comment',function(req,res,next){
  if(!req.session.signIned){
    res.redirect('/');
    return;
  }
  //illegal data
  if((!req.body.anime_name)||(!req.body.episodes)||(!req.body.status)||(!req.body.score)||(!req.body.username)||(!req.body.anime_id)||(!req.body.episodes_o)||(!req.body.score_o)||(!req.body.status_o)){
    console.log('illegal data');
    req.session.errorType=2;
    res.redirect("/#edit_comment_"+req.body.anime_id);
    return;
  }
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
            user_watching:rows[0].user_watching+w,
            user_completed:rows[0].user_completed+c,
            user_onhold:rows[0].user_onhold+o,
            user_dropped:rows[0].user_dropped+d,
            user_plantowatch:rows[0].user_plantowatch+p,
            stats_mean_score:rows[0].stats_mean_score*n/(n-1)-req.body.score_o/(n-1),
            stats_episodes:parseInt(rows[0].stats_episodes,10)-parseInt(req.body.episodes_o,10)
          };
          if(n-1==0){
            data.stats_mean_score=0;
          }
          req.con.query('UPDATE users_cleaned SET ? WHERE username=?',[data,req.session.user],function(err,rows){
            req.con.query('UPDATE UserList9 SET ? WHERE username=?',[data,req.session.user],function(err,rows){
              req.con.query('SELECT * FROM AnimeList9 WHERE anime_id=?',req.body.anime_id,function(err,rows){
                var data={
                	score:req.body.score/(rows[0].members+1)+rows[0].score,
                	members:rows[0].members+1
                };
                req.con.query('UPDATE AnimeList9 SET ? WHERE anime_id=?',[data,req.body.anime_id],function(err,rows){
                  req.con.query('SELECT * FROM anime WHERE MAL_ID=?',req.body.anime_id,function(err,rows){
                    var data={
                    	Score:rows[0].Score*rows[0].Members/(rows[0].Members-1)-req.body.score/(rows[0].Members-1),
                    	Members:rows[0].Members-1,
                    	Watching:rows[0].Watching+w,
                    	Completed:rows[0].Completed+c,
                    	On_Hold:rows[0].On_Hold+o,
                    	Dropped:rows[0].Dropped+d,
                    	Plan_to_Watch:rows[0].Plan_to_Watch+p,
                    	Score_10:rows[0].Score_10,
                    	Score_9:rows[0].Score_9,
                    	Score_8:rows[0].Score_8,
                    	Score_7:rows[0].Score_7,
                    	Score_6:rows[0].Score_6,
                    	Score_5:rows[0].Score_5,
                    	Score_4:rows[0].Score_4,
                    	Score_3:rows[0].Score_3,
                    	Score_2:rows[0].Score_2,
                    	Score_1:rows[0].Score_1
                    };
                    if(rows[0].Members-1==0){
                      data.Score=0;
                    }
                    if(req.body.score==1){
                      data.Score_1-=1;
                    }
                    else if(req.body.score==2){
                      data.Score_2-=1;
                    }
                    else if(req.body.score==3){
                      data.Score_3-=1;
                    }
                    else if(req.body.score==4){
                      data.Score_4-=1;
                    }
                    else if(req.body.score==5){
                      data.Score_5-=1;
                    }
                    else if(req.body.score==6){
                      data.Score_6-=1;
                    }
                    else if(req.body.score==7){
                      data.Score_7-=1;
                    }
                    else if(req.body.score==8){
                      data.Score_8-=1;
                    }
                    else if(req.body.score==9){
                      data.Score_9-=1;
                    }
                    else if(req.body.score==10){
                      data.Score_10-=1;
                    }
                    req.con.query('UPDATE anime SET ? WHERE MAL_ID=?',[data,req.body.anime_id],function(err,rows){
                      console.log('DELETE');
                      res.redirect('/#comment');
                      return;
                    });
                  });
                });
              });
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
      score:req.body.score,
      status:req.body.status
    };
    req.con.query('UPDATE comment SET ? WHERE username=? AND anime_id=?',[data,req.session.user,req.body.anime_id],function(err,rows){
      var data={
        username:req.session.user,
        anime_id:req.body.anime_id,
        my_watch_episodes:req.body.episodes,
        my_score:req.body.score,
        my_status:req.body.status
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
            user_watching:rows[0].user_watching+w+w_o,
            user_completed:rows[0].user_completed+c+c_o,
            user_onhold:rows[0].user_onhold+o+o_o,
            user_dropped:rows[0].user_dropped+d+d_o,
            user_plantowatch:rows[0].user_plantowatch+p+p_o,
            stats_mean_score:rows[0].stats_mean_score-req.body.score_o/n+req.body.score/n,
            stats_episodes:parseInt(rows[0].stats_episodes,10)-parseInt(req.body.episodes_o,10)+parseInt(req.body.episodes,10)
          };
          req.con.query('UPDATE users_cleaned SET ? WHERE username=?',[data,req.session.user],function(err,rows){
            req.con.query('UPDATE UserList9 SET ? WHERE username=?',[data,req.session.user],function(err,rows){
              req.con.query('SELECT * FROM AnimeList9 WHERE anime_id=?',req.body.anime_id,function(err,rows){
                var data={
                	score:req.body.score/(rows[0].members+1)+rows[0].score,
                	members:rows[0].members+1
                };
                req.con.query('UPDATE AnimeList9 SET ? WHERE anime_id=?',[data,req.body.anime_id],function(err,rows){
                  req.con.query('SELECT * FROM anime WHERE MAL_ID=?',req.body.anime_id,function(err,rows){
                    var data={
                    	Score:rows[0].Score*rows[0].Members/(rows[0].Members+1)-req.body.score_o/(rows[0].Members+1)+req.body.score/(rows[0].Members+1),
                    	Members:rows[0].Members-1,
                    	Watching:rows[0].Watching+w+w_o,
                    	Completed:rows[0].Completed+c+c_o,
                    	On_Hold:rows[0].On_Hold+o+o_o,
                    	Dropped:rows[0].Dropped+d+d_o,
                    	Plan_to_Watch:rows[0].Plan_to_Watch+p+p_o,
                    	Score_10:rows[0].Score_10,
                    	Score_9:rows[0].Score_9,
                    	Score_8:rows[0].Score_8,
                    	Score_7:rows[0].Score_7,
                    	Score_6:rows[0].Score_6,
                    	Score_5:rows[0].Score_5,
                    	Score_4:rows[0].Score_4,
                    	Score_3:rows[0].Score_3,
                    	Score_2:rows[0].Score_2,
                    	Score_1:rows[0].Score_1
                    };
                    if(req.body.score_o==1){
                      data.Score_1-=1;
                    }
                    else if(req.body.score_o==2){
                      data.Score_2-=1;
                    }
                    else if(req.body.score_o==3){
                      data.Score_3-=1;
                    }
                    else if(req.body.score_o==4){
                      data.Score_4-=1;
                    }
                    else if(req.body.score_o==5){
                      data.Score_5-=1;
                    }
                    else if(req.body.score_o==6){
                      data.Score_6-=1;
                    }
                    else if(req.body.score_o==7){
                      data.Score_7-=1;
                    }
                    else if(req.body.score_o==8){
                      data.Score_8-=1;
                    }
                    else if(req.body.score_o==9){
                      data.Score_9-=1;
                    }
                    else if(req.body.score_o==10){
                      data.Score_10-=1;
                    }
                    if(req.body.score==1){
                      data.Score_1+=1;
                    }
                    else if(req.body.score==2){
                      data.Score_2+=1;
                    }
                    else if(req.body.score==3){
                      data.Score_3+=1;
                    }
                    else if(req.body.score==4){
                      data.Score_4+=1;
                    }
                    else if(req.body.score==5){
                      data.Score_5+=1;
                    }
                    else if(req.body.score==6){
                      data.Score_6+=1;
                    }
                    else if(req.body.score==7){
                      data.Score_7+=1;
                    }
                    else if(req.body.score==8){
                      data.Score_8+=1;
                    }
                    else if(req.body.score==9){
                      data.Score_9+=1;
                    }
                    else if(req.body.score==10){
                      data.Score_10+=1;
                    }
                    req.con.query('UPDATE anime SET ? WHERE MAL_ID=?',[data,req.body.anime_id],function(err,rows){
                      console.log('EDIT');
                      res.redirect('/#comment');
                      return;
                    });
                  });
                });
              });
            });
          });
        });
      });
    });
  }
});

router.post('/s1',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s1',
    hash:'search',
    query:req.body
  }));
});
router.post('/s2',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s2',
    hash:'search',
    query:req.body
  }));
});
router.post('/s3',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s3',
    hash:'search',
    query:req.body
  }));
});
router.post('/s4',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s4',
    hash:'search',
    query:req.body
  }));
});
router.post('/s5',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s5',
    hash:'search',
    query:req.body
  }));
});
router.post('/s6',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s6',
    hash:'search',
    query:req.body
  }));
});
router.post('/s7',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s7',
    hash:'search',
    query:req.body
  }));
});
router.post('/s8',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s8',
    hash:'search',
    query:req.body
  }));
});
router.post('/s9',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s9',
    hash:'search',
    query:req.body
  }));
});
router.post('/s10',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s10',
    hash:'search',
    query:req.body
  }));
});
router.post('/s11',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s11',
    hash:'search',
    query:req.body
  }));
});
router.post('/s12',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s12',
    hash:'search',
    query:req.body
  }));
});
router.post('/s13',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s13',
    hash:'search',
    query:req.body
  }));
});
router.post('/s14',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s14',
    hash:'search',
    query:req.body
  }));
});
router.post('/s15',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s15',
    hash:'search',
    query:req.body
  }));
});
router.post('/s16',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s16',
    hash:'search',
    query:req.body
  }));
});
router.post('/s17',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s17',
    hash:'search',
    query:req.body
  }));
});
router.post('/s18',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s18',
    hash:'search',
    query:req.body
  }));
});
router.post('/s19',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s19',
    hash:'search',
    query:req.body
  }));
});
router.post('/s20',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s20',
    hash:'search',
    query:req.body
  }));
});
router.post('/s21',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s21',
    hash:'search',
    query:req.body
  }));
});
router.post('/s22',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s22',
    hash:'search',
    query:req.body
  }));
});
router.post('/s23',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s23',
    hash:'search',
    query:req.body
  }));
});
router.post('/s24',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s24',
    hash:'search',
    query:req.body
  }));
});
router.post('/s25',function(req,res,next){
  console.log("yeeeee");
  res.redirect(url.format({
    pathname:'/s25',
    hash:'search',
    query:req.body
  }));
});
router.post('/s26',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s26',
    hash:'search',
    query:req.body
  }));
});
router.post('/s27',function(req,res,next){
  res.redirect(url.format({
    pathname:'/s27',
    hash:'search',
    query:req.body
  }));
});
module.exports = router;
