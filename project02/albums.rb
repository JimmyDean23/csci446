#!/usr/bin/env ruby
require 'rack'
require 'erb'

class AlbumApp
	def call(env)
		request = Rack::Request.new(env)
		case request.path
		when "/form" then render_form
		when "/list" then render_list(request)
		else render_404
		end
	end

	def render_form
		Rack::Response.new(ERB.new(File.read("form.html.erb")).result(binding))
	end

	def render_list(request)
		albums = File.readlines("top_100_albums.txt")
		Rack::Response.new(ERB.new(File.read("list.html.erb")).result(binding))
	end

	def render_404
		[404, {"Content-Type" => "text/plain"}, ["Nothing here!"]]
	end

end

Signal.trap('INT') {
  Rack::Handler::WEBrick.shutdown
}

Rack::Handler::WEBrick.run AlbumApp.new, :Port => 8080