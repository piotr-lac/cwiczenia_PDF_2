class Biblioteka
	
	attr_accessor :lista_czytelnikow
	attr_writer :ksiegozbior

	def initialize
		@ksiegozbior = []		# wszystkie mozliwe ksiazki w bibliotece
		@lista_czytelnikow = []
	end

	
	def dodaj_ksiazke(ksiazka)
		@ksiegozbior << ksiazka
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