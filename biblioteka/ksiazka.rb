require "./history.rb"
require "./biblioteka.rb"

class Ksiazka
	attr_accessor :stan
	attr_reader :autor, :tytul
	def initialize(tytul,autor)
		@tytul = tytul
		@autor = autor
		@stan = 0 #stan 0 to ksiazka ktora nie jest wypozyczona
	end
end