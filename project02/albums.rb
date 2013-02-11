#!/usr/bin/env ruby
require 'rack'

class AlbumApp
  def call(env)
  	request = Rack::Request.new(env)
    [200, {"Content-Type" => "text/plain"}, ["Hello from Rack!"]]
  end
end

Rack::Handler::WEBrick.run AlbumApp.new, :Port => 8080