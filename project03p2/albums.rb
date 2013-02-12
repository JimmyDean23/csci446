require 'sinatra'
require 'data_mapper'
require_relative 'album'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/albums.sqlite3.db")

set :port, 8080

get "/" do
  "Sinatra is working!"
end

get "/form" do
	@page_content = "form.html.erb"
	erb :index
end

post "/list/:order" do
	#@albums = Album.all(:order => params[:order].intern.asc)
	@page_content = "list.html.erb"
	erb :index
end