class Album

	attr_accessor :rank, :title, :year

	def initialize(row)
		@rank = row["rank"]
		@title = row["title"]
		@year = row["year"]
	end

end