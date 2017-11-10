class Ksiazka
	
	attr_accessor :stan, :historia
	attr_reader :autor, :tytul
	
	def initialize(tytul,autor)
		@tytul = tytul
		@autor = autor
		@stan = 0 #stan 0 to ksiazka ktora nie jest wypozyczona
		@historia = []
	end

	def spis
		@historia.each {|x| puts x.join(" ")}
	end
	
end