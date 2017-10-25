first, second = ARGV
first = first.to_i
second = second.to_i


first, second = second, first if first > second

a = (first..second).to_a.delete_if{|x| x<=1}
liczby_pierwsze=[]

loop do 
	liczby_pierwsze << a[0]
	a.select!{|x| x%a[0]!=0}
	break if a.length == 0 
end

print liczby_pierwsze.compact.empty? ? "Prime numbers : no prime numbers" : "Prime numbers : #{liczby_pierwsze.join(" ")}"


