# Załączony plik products.csv (format CSV) zawiera nazwy produktów, ich ceny oraz
# wagę. Napisz program, który:
# • wczyta produkty oraz ich ceny z pliku products.csv
# • umożliwi wyszukanie produktu po jego nazwie

# 	$ ruby products.rb -f apple
# 	apple 1.25zł

# • umożliwi wyświetlenie produktów tańszych/droższych od podanej w argumencie
# ceny

# 	$ ruby products.rb -gt 2.25
# 	orange 2.50zł
# 	carrot 2.30zł
# 	juice	5.50zł
# 	chocolate 7.20zł

# 	$ ruby products.rb -lt 2.25
# 	sunflower seeds 0.99zł
# 	oil 2.22zł
# 	cookies 2.20zł
# 	flour 1.99zł
# 	sugar 2.00zł
# • umożliwi konwersję cen produktów do innej waluty po zadanym w argumencie
# wywołania kursie, dane po konwersji zapisze do pliku o zadanej w argumencie
# wywołania nazwie

# 	$ ruby products.rb -c 3.45 EUR productsEUR.csv

require "csv"

parametr_1, parametr_2 = ARGV


file ="products.csv"

case parametr_1
	when "-f"
		CSV.foreach(file, headers: true) do |row|
		puts "#{row[0]} #{row[1]}zł "if row[0] == parametr_2
	end
	when "-gt"
	CSV.foreach(file, headers: true) do |row|
		puts "#{row[0]} #{row[1]}zł "if row[1].to_f > parametr_2.to_f
	end
	when "-lt"
		CSV.foreach(file, headers: true) do |row|
		puts "#{row[0]} #{row[1]}zł "if row[1].to_f < parametr_2.to_f
	end
	when "-c"
		puts "koko"
	

end

