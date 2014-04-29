require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'will_paginate-bootstrap'
require 'will_paginate/array'

require_relative 'lib/paginate-bootstrap'
include PaginateBootstrap
also_reload 'lib/**'
also_reload '*.rb'

def categories
  [Company, Product]
end

def current?(path = '')
  request.path_info == "/#{path}"
end

get '/' do
  erb :index
end

categories.each do |c|
  get "#{c.path}/:id" do |id|
    @one = c.by_id(id)
    @title = @type = c.singular
    pass unless @one
    erb :one
  end

  get "/#{c.plural}" do
    @all = c.all
    @title = c.plural.capitalize
    @type = c.plural
    @paginated = @all.sort{|l,r| l.name <=> r.name}.paginate(:page => params[:page], :per_page => 5)
    erb :many
  end
end
