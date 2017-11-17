require "./biblioteka.rb"

class Czytelnik
	attr_reader :nazwisko
	attr_accessor :posiada, :id 
	def initialize(nazwisko)
		@nazwisko = nazwisko
		@id = nil
		@posiada = []
	end

	def wypozycz(ksiazka,data,biblioteka) 
		if ksiazka.stan == 0
			ksiazka.stan = 1
			@posiada << [ksiazka,data]
			biblioteka.spis_kart.select{|x| x.ksiazka == ksiazka}[0].list << [@nazwisko,"wypozyczyl",data]
		else
			puts "ksiazka nie jest dostepna do wypozyczenia"
		end
	end

	def oddaj(ksiazka,data,biblioteka)
		if @posiada.select{|x| x[0] == ksiazka}.empty?
			puts "Czytelnik #{@nazwisko} nie posiada tej ksiazki (tytul:#{ksiazka.tytul})"
		else
			ksiazka.stan = 0
			@posiada.select!{|x| x[0] != ksiazka}
			biblioteka.spis_kart.select{|x| x.ksiazka == ksiazka}[0].list << [@nazwisko,"oddał",data]
		end
	end

	def posiada_ksiazki?
		if @posiada.empty?
			puts "Czytelnik #{@nazwisko} nie posiada obecnie żadnych książek wypożyczonych"
		else
		puts "Czytelnik #{@nazwisko} posiada obecnie ksiazki :"
		@posiada.each {|x| puts "tytul:#{x[0].tytul} - autor:#{x[0].autor} -- wypożyczone od dnia #{x[1]}"}
		end
	end
end