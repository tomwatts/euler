#!/usr/bin/env ruby

def is_prime(n)
	if ( n <= 2 )
		return true
	end

	(2..n-1).each do |divisor|
		if ( n % divisor == 0 )
			return false
		end
	end

	return true
end

def largest_prime_factor(n)

	(1..n).each do |factor|

	end

	return prime_factor
end

#n = 13195
#print "Largest prime factor of " + n.to_s + ": " + largest_prime_factor(n).to_s

n = 5
print n.to_s + " is " + ("not " unless (is_prime(n))) + "prime"

