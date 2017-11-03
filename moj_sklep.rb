class Klient
	attr_accessor :lista_zakupow, :koszyk, :zaplacone
	attr_reader :kasa, :imie
	
	def initialize(imie,kasa)
		@imie = imie
		@kasa = kasa
		@lista_zakupow = []
		@koszyk = []
		@zaplacone = []
	end

	def wez_do_koszyka(sklep)
		@lista_zakupow.length.times do |x|
			 sklep.towary.each do |y| 
			 	if y.nazwa_produktu == @lista_zakupow[x]
			 		@koszyk << y
			 		@lista_zakupow[x] = nil
			 		i = sklep.towary.index(y)
			 		sklep.towary.delete_at(i)
			 	end
			 end
		end
		@lista_zakupow.compact!
	end

	def platnosc_w_kasie(sklep)
		loop do 
			break if koszyk[0] == nil || koszyk[0].cena > @kasa 
			@zaplacone << koszyk[0]
			@kasa = @kasa - koszyk[0].cena
			@koszyk.shift
		end
			if !@koszyk.nil?
				sklep.towary = sklep.towary + @koszyk
			end
	end
end

class Sklep
	attr_accessor :towary
	def initialize(nazwa_sklepu)
		@nazwa_sklepu = nazwa_sklepu
		@towary = []
	end

	def dostawa(towar,liczba_sztuk = 1)
		liczba_sztuk.times do 
			@towary << towar
			puts towar.nazwa_produktu
		end
	end

	def polka
		@towary.each {|x| puts "#{x.nazwa_produktu} cena : #{x.cena} zł"}
	end

end

class Produkt
	attr_reader :nazwa_produktu, :cena
	def initialize(nazwa_produktu,cena)
		@nazwa_produktu = nazwa_produktu
		@cena = cena.to_f
	end
end


klient_1 = Klient.new("Janusz",5)
biedra = Sklep.new("Biedronka")
jaja = Produkt.new("jajka",2.50)
maslo = Produkt.new("maslo maslane",6)
chleb = Produkt.new("chleb",2)
cukierki = Produkt.new("czekolada",5)



puts "jak ma na imie klient ?"
puts klient_1.imie # jak ma na imie klient
puts "ile janusz ma kasy ?"
puts klient_1.kasa # ile janusz ma kasy
puts "co janusz ma kupic na poczatku ?"
p klient_1.lista_zakupow # co janusz ma kupić
puts "-------------------------"
klient_1.lista_zakupow = ["jajka", "chleb", "margaryna", "chleb"] # janusz, kup to!
puts "co janusz ma kupic ?"
print klient_1.lista_zakupow # co janusz ma kupić
puts
puts "--------------------------------------"
puts "jakie towary ma sklep biedronka na poczatku ?"
print biedra.towary #jakie towary ma sklep Biedronka
puts
puts "--------------------------------------------"
puts "co będzie wykładane na połke w sklepie ?"
biedra.dostawa(jaja) # doloz jaja na polke
biedra.dostawa(maslo,3) # doloz maslo na polke 
biedra.dostawa(chleb,2) # doloz chleb na polke
biedra.dostawa(cukierki,3)
puts "---------------"
puts "co jest na półce ?"
biedra.polka
puts "----------------------------"
puts "co klient ma w koszyku po realizacji listy zakupów ?"
klient_1.wez_do_koszyka(biedra)
print klient_1.koszyk
puts
puts "---------------------------------------------------"
puts "co zostało klientowi na liście zakupów bo nie było tego w sklepie ?"
print klient_1.lista_zakupow
puts
puts "------------------------"
puts "co zostało na półce w sklepie po realizacji listy zakupów ?"
biedra.polka
puts "--------------------------------"
puts "janusz płaci przy kasie, ile reszty mu zostanie ?"
klient_1.platnosc_w_kasie(biedra)
print klient_1.kasa
puts
puts "----------"
puts "na co januszowi starczyło pieniędzy i co tym samym kupił ? "
print klient_1.zaplacone
puts
puts "-------------------------"
puts "co januszowi zostało w koszyku bo nie miał kasy ?"
print klient_1.koszyk
puts 
puts "---------------------------"
puts "co zostalo na półce w sklepie po tym jak janusz musiał oddac to, za co nie zapłacił ? (no chyba ze kupil wszystko) "
biedra.polka

