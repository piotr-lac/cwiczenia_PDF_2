class History
	attr_accessor :tytul, :list, :ksiazka
	def initialize(ksiazka)
		@ksiazka = ksiazka
		@list = []
	end
end