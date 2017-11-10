class Czytelnik
	attr_reader :nazwisko
	attr_accessor :posiada, :id, :historia
	
	def initialize(nazwisko)
		@nazwisko = nazwisko
		@id = nil
		@posiada = []
		@historia = []

	end

	def wypozycz(ksiazka,data) 
		if ksiazka.stan == 0
			ksiazka.stan = 1
			@posiada << [ksiazka,data]
			ksiazka.historia << [self.nazwisko,"wypozyczyl",data]
			@historia << "ksiazka: #{ksiazka.tytul} została wypożyczna #{data}"
		else
			puts "ksiazka nie jest dostepna do wypozyczenia"
		end
	end

	def oddaj(ksiazka,data)
		if @posiada.select{|x| x[0] == ksiazka}.empty?
			puts "Czytelnik #{self.nazwisko} nie posiada tej ksiazki (tytul:#{ksiazka.tytul})"
		else
			ksiazka.stan = 0
			@posiada.select!{|x| x[0] != ksiazka}
			ksiazka.historia << [self.nazwisko,"oddal",data]
			@historia << "ksiazka: #{ksiazka.tytul} została oddana #{data}"
		end
	end

	def posiada_ksiazki?
		if @posiada.empty?
			puts "Czytelnik #{self.nazwisko} nie posiada obecnie żadnych książek wypożyczonych"
		else
		puts "Czytelnik #{self.nazwisko} posiada obecnie ksiazki :"
		@posiada.each {|x| puts "tytul:#{x[0].tytul} - autor:#{x[0].autor} -- wypożyczone od dnia #{x[1]}"}
		end
	end

	def historia
		@historia.each {|x| puts x}
	end
end