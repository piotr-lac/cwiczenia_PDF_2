require "./ksiazka.rb"
require "./czytelnik.rb"

class Biblioteka
	attr_accessor :lista_czytelnikow, :spis_kart
	attr_writer :ksiegozbior
	def initialize
		@ksiegozbior = []		# wszystkie mozliwe ksiazki w bibliotece
		@lista_czytelnikow = []
		@spis_kart =[]
	end
	
	def dodaj_ksiazke(ksiazka)
		@ksiegozbior << ksiazka
		@spis_kart << History.new(ksiazka)
	end

	def karta(ksiazka)
		@spis_kart.select{|x| x.ksiazka == ksiazka}[0].list.each {|rekord| puts "#{rekord[0]} #{rekord[1]} #{rekord[2]}"} 
	end

	def historia(czytelnik)
		z=[]
		@spis_kart.each {|y| z << y if y.list.select{|x| x[0] == "#{czytelnik.nazwisko}"}.length>0}
		z.each {|y| print "'#{y.ksiazka.tytul}'" ,y.list.select{|x| x if x[0]==czytelnik.nazwisko}, puts}
	end

	def dodaj_czytelnika(czytelnik)
		czytelnik.id = "#{[*('a'..'z')].shuffle[0,4].join}#{[*('0'..'9')].shuffle[0,4].join}"
		@lista_czytelnikow << czytelnik
	end

	private

	def polka 	# ksiazki gotowe do wypozyczenia
		@ksiegozbior.select{|x| x.stan == 0}
	end

	def wypozyczone # ksiazki wypozyczone
		@ksiegozbior.select {|x| x.stan ==1}
	end
end