class Album

	attr_accessor :rank, :title, :year

	def initialize(rank, raw_string)
		@rank = rank
		@title = raw_string.split(',').first
		@year = raw_string.split(',').last[/\d+/].to_i
	end

end