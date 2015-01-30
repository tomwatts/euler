#!/usr/bin/env ruby

def last_ten_digits_of_self_power(n)
	product = 1
	(1..n).each do
		product = product * n
		if (product > 10000000000)
			product = product % 10000000000
		end
	end

	return product
end

def last_ten_digits_of_series(n)
	sum = 0
	(1..n).each do |x|
		sum += self_power(x)
	end

	sum = sum % 10000000000

	return sum
end

n = 1000

start_time = Time.now
result = last_ten_digits_of_series(n)
end_time = Time.now

print "Last ten digits of series up to #{n}: #{result}\nElapsed time: " + \
	"#{end_time - start_time} s\n"

