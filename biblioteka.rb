class Biblioteka
	
	attr_accessor :ksiegozbior, :na_polce, :lista_czytelnikow

	def initialize
		@ksiegozbior = []		# wszystkie ksiazki w bibliotece
		@na_polce = []
		@lista_czytelnikow = []
		
	end

	def polka 	# ksiazki gotowe do wypozyczenia
		@ksiegozbior.select{|x| x.stan==0}
	end

	def dodaj_ksiazke(ksiazka)
		@ksiegozbior << ksiazka
	end

	def dodaj_czytelnika(czytelnik)
		czytelnik.id = "#{rand(1000)}#{78.chr}"
		@lista_czytelnikow << czytelnik
	end



end

class Ksiazka
	attr_accessor :stan
	attr_reader :autor, :tytul
	
	def initialize(tytul,autor)
		@tytul = tytul
		@autor = autor
		@stan = 0
	end
end

class Czytelnik
	attr_reader :nazwisko
	attr_accessor :posiada, :id
	
	def initialize(nazwisko)
		@nazwisko = nazwisko
		@id = nil
		@posiada = []
	end

	def wypozycz(ksiazka,data) #sprawdzenie czy ksiazka jest na polce, ksiazka wpada do @posiada, ksiazka znika z polki, rejestr wypozycznej ksiazki
		@posiada << ksiazka
	end
end

biblo = Biblioteka.new

janek = Czytelnik.new("kowalski")
michal = Czytelnik.new("wisniewski")
tomek = Czytelnik.new("iksinski")

ksiazka_1 = Ksiazka.new("Abecadło","Iksinski")
ksiazka_2 = Ksiazka.new("Slownik","Wolinski")
ksiazka_3 = Ksiazka.new("Encyklopedia","Zdzielinski")
ksiazka_4 = Ksiazka.new("Literaki","Bitkowski")
ksiazka_5 = Ksiazka.new("Cyferaki","Latkowski")
ksiazka_6 = Ksiazka.new("Ruby The Book","Ygrekowski")
ksiazka_7 = Ksiazka.new("Kolejna ksiazka","Milkowski")
ksiazka_8 = Ksiazka.new("Ile jeszcze","Bruder")
ksiazka_9 = Ksiazka.new("Telefoniczna","Schwarz")
ksiazka_10 = Ksiazka.new("Poradnik","Lolinski")


biblo.dodaj_ksiazke(ksiazka_1)
biblo.dodaj_ksiazke(ksiazka_2)
biblo.dodaj_ksiazke(ksiazka_3)
biblo.dodaj_ksiazke(ksiazka_4)
biblo.dodaj_ksiazke(ksiazka_5)
biblo.dodaj_ksiazke(ksiazka_6)
biblo.dodaj_ksiazke(ksiazka_7)
biblo.dodaj_ksiazke(ksiazka_8)
biblo.dodaj_ksiazke(ksiazka_9)
biblo.dodaj_ksiazke(ksiazka_10)


biblo.dodaj_czytelnika(janek)
biblo.dodaj_czytelnika(michal)
biblo.dodaj_czytelnika(tomek)

puts "---------------"
puts "• wyświetlenie listy wszystkkich książek w bibliotece"
biblo.ksiegozbior.each {|x| puts "#{x.tytul}--#{x.autor}"}
puts "---------------"
puts "• wyświetlenie listy książek dostepnych na polce (niewypozyczonych)"
biblo.polka.each {|x| puts "#{x.tytul}--#{x.autor}"}
puts "---------------"
print biblo.lista_czytelnikow
