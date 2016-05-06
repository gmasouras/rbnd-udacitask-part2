class VideoGameItem
	include Listable
	attr_reader :description, :release_date, :type

	def initialize(vgame_title, options = {})
		@description = vgame_title
		@release_date = options[:release_date] ? Chronic.parse(options[:release_date]) : options[:release_date]
		@type = "vgame"
	end
	def details
		format_description(@description) + "release date: " +
		format_date(@release_date, nil) 
	end
end