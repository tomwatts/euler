#!/usr/bin/env ruby

def is_prime(n)
	if ( n <= 2 )
		return true
	end

	(2..(n/2)).each do |divisor|
		if ( n % divisor == 0 )
			return false
		end
	end

	return true
end

def largest_prime_factor(n)
	# Check if n itself is prime
	return n if (is_prime(n))

	lower_factors = []
	upper_factors = []

	# Iterate over the lower factors and calculate their partner factor
	Math.sqrt(n).floor.downto(1).each do |lower_factor|
		if (n % lower_factor == 0)
			# Keep both arrays in descending order
			lower_factors << lower_factor
			upper_factors.insert(0, n / lower_factor)
		end
	end

	(upper_factors + lower_factors).each do |factor|
		return factor if (is_prime(factor))
	end

	return 1
end

n = ARGV[0]
if (n.nil?)
	abort "Usage: largest_prime_factor INTEGER\n"
elsif (false if (Integer(n)) rescue true)
	abort "#{n} is not an Integer\n"
end

n = n.to_i
print "The largest prime factor of #{n} is #{largest_prime_factor(n)}"

