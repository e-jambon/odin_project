def ftoc t_farenheit
	((t_farenheit - 32.0) / 1.8).round(2)
end

def ctof t_celsius
	((t_celsius * 1.8) + 32).round(2)
end