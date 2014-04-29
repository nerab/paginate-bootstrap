# Paginate Bootstrap

Sample app that uses [Bootstrap](http://getbootstrap.com) + [will_paginate](http://github.com/mislav/will_paginate), based on the [Minimal Sinatra template](https://github.com/rkh/sinatra-template).

## Run

    bundle install
    foreman start

## Deploy to Heroku:

    heroku create --stack cedar
    heroku config:add RACK_ENV=production
    git push heroku master

