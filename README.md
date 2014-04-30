# Paginate Bootstrap

Tiny [Sinatra](http://sinatrarb.com) sample app that uses [Bootstrap](http://getbootstrap.com) + [will_paginate](http://rubygems.org/gems/will_paginate) through [will_paginate-bootstrap](http://rubygems.org/gems/will_paginate-bootstrap).

The app is based on the [Minimal Sinatra template](https://github.com/rkh/sinatra-template).

The interesting files are the [app](app.rb) and the [view](views/many.erb).

## Run

    bundle install
    foreman start

## Deploy to Heroku:

    heroku create --stack cedar
    heroku config:add RACK_ENV=production
    git push heroku master

