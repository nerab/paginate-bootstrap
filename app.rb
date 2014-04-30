require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'will_paginate-bootstrap'
require 'will_paginate/array'

require_relative 'lib/paginate-bootstrap'
include PaginateBootstrap

def categories
  [Company, Product]
end

def current?(path = '')
  request.path_info == "/#{path}"
end

get '/' do
  @title = 'Home'
  erb :index
end

categories.each do |category|
  get "#{category.path}/:id" do |id|
    @one = category.by_id(id)
    pass unless @one
    @type = category.singular
    @title = @one.name
    erb :one
  end

  get "/#{category.plural}" do
    @all = category.all
    @title = category.plural.capitalize
    @type = category.plural
    @paginated = @all.sort{|l,r| l.name <=> r.name}.paginate(:page => params[:page], :per_page => 5)
    erb :many
  end
end

not_found do
  @title = 'Oops...'
  @message = 'Not found'
  erb :error
end

error do
  @title = 'Oops...'
  @message = env['sinatra.error']
  erb :error
end
