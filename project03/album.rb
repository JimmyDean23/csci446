class Album

	attr_accessor :rank, :name, :year

	def initialize(rank, raw_string)
		@rank = rank
		@name = raw_string.split(',').first
		@year = raw_string.split(',').last[/\d+/].to_i
	end

end