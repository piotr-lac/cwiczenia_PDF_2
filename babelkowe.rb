
a=ARGV.map!{|x| x.to_i}
n=a.length-1

while n > 0
	n.times do |x|
		if a[x]>a[x+1]
			a[x],a[x+1]=a[x+1],a[x]
		end
	end
n=n-1
end

print a.join(" ")


