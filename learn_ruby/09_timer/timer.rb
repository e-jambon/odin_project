class Timer

	attr_accessor :seconds, :minutes, :hours

	def initialize
		@seconds= 0
	end

	def time_string
		hours=@seconds/3600
		left  = @seconds%3600
		minutes = left/60
		l_seconds = left%60
		sprintf("%02d:%02d:%02d", hours, minutes, l_seconds)
	end
end