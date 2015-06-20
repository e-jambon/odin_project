def add a, b
  a + b 
end

def subtract a, b
  a - b 
end

def sum a
	r=0
	a.each do |i| r += i
	end
	r
end

def multiply *numbers
	r=1
	numbers.each {|number| r = r * number }
	r
end

def power a,b
	a**b
end

def factorial n 
	n == 0 ? 1 : n*factorial(n-1)
end

 
