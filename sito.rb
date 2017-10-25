first, second = ARGV

a = (first.to_i..second.to_i).to_a
liczby_pierwsze=[]
a.delete_if{|x| x<=1}
loop do 
	liczby_pierwsze << a[0]
	a.select!{|x| x%a[0]!=0}
	break if a.length == 0 
end

print liczby_pierwsze.compact!.empty? ? "brak liczb pierwszych w zasięgu #{first} : #{second}" : liczby_pierwsze

