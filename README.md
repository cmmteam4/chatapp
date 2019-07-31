# README

ステップ13: デプロイをしよう ( Step 13 : Let's deploy )
* Heroku deploy steps
    -heroku login -i
    -heroku apps:create team4chatapp
    -heroku git:remote -a team4chatapp
    -git push heroku master
    -heroku pg:info
    -heroku addons:create heroku-postgresql
    -heroku pg:info
    -heroku config --app team4chatapp
    -heroku run rails db:migrate
   



