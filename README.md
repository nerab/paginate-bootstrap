Bootstrap + will_paginate template. Based on [Minimal Sinatra template](https://github.com/rkh/sinatra-template).

Run:

    bundle install
    foreman start

Deploy to heroku:

    heroku create --stack cedar
    heroku config:add RACK_ENV=production
    git ps heroku

