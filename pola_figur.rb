class Figure
	def pole
		print "Pole #{self.class} wynosi : "
	end

	def obwod
		print "Obwod #{self.class} wynosi : "
	end

end

class Disk < Figure
	def initialize(radius)
		@radius = radius
	end

	def pole
		super
		(Math::PI*(@radius**2)).round
	end

	def obwod
		super 
		(2*Math::PI*@radius).round
	end
end

class Trapezium < Figure
	def initialize(a,b,c)
		@a=a
		@b=b
		@c=c
	end

	def pole
		super
		((@a+@b)*@c)/2
	end
end

class Rectangle < Figure
	def initialize(a,b=a)
		@a = a
		@b = b
	end

	def pole
		super
		@a*@b
	end

	def obwod
		super 
		2*@a+2*@b
	end
end

class Square < Rectangle
end



d=Disk.new(5)
r=Rectangle.new(3,7)
s=Square.new(8)
t=Trapezium.new(13,7,2)


puts d.pole
puts d.obwod
puts r.pole
puts r.obwod
puts s.pole
puts s.obwod
puts t.pole
