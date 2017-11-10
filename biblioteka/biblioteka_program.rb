# Napisz program do obsługi biblioteki. Powinien on umożliwiać:
# • wyświetlenie listy książek w bibliotece, z zaznaczeniem dostępnych oraz aktualnie
# wypożyczonych (lista książek nie powinna być udostępniona publicznie) - zrobione
# • dodawanie nowych książek do listy dostępnych w bibliotece - zrobione
# • wypożyczanie i oddawanie książek przez czytelników (niemożliwe jest
# wypożyczenie już wypożyczonej książki) - zrobnione
# • dodawanie nowych czytelników do biblioteki wraz z generowaniem im numeru karty
# bibliotecznej (powinien on składać się z liter oraz cyfr i być unikalny dla każdego
# czytelnika) - zrobione
# • wyświetlenie listy książek wypożyczonych w danym momencie przez konkretnego
# czytelnika, wraz z datami wypożyczenia każdej z nich - zrobione
# • wyświetlenie historii wypożyczeń danego czytelnika wraz z czasem
# przetrzymywania każdej z nich (uwzględniającej oddane już książki)

require "./biblioteka.rb"
require "./czytelnik.rb"
require "./ksiazka.rb"

biblo = Biblioteka.new

janek = Czytelnik.new("kowalski")
michal = Czytelnik.new("wisniewski")
tomek = Czytelnik.new("lodzinski")

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

