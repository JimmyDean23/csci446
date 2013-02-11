#!/usr/bin/env ruby
require 'rack'
require 'erb'
require_relative 'album'

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
		sort_order = request.params['order']
		rank_to_highlight = request.params['rank'].to_i

		albums = File.readlines("top_100_albums.txt").each_with_index.map do |record, i|
			Album.new(i+1, record)
		end
		albums.sort! do |l, r|
			l.send(sort_order.intern) <=> r.send(sort_order.intern)
		end
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