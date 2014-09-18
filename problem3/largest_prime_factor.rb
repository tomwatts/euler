#!/usr/bin/env ruby

def is_prime(n)
	if ( n <= 2 )
		return true
	end

	(2..(n/2)).each do |divisor|
		if ( n % divisor == 0 )
			#print n.to_s + " is not prime\n"
			return false
		end
	end

	return true
end

def largest_prime_factor(n)

	(n / 2).downto(2) do |potential_factor|
		#print "potential_factor=" + potential_factor.to_s + "\n"
		if (n % potential_factor == 0)
			#print potential_factor.to_s + " is a factor of " + n.to_s + "\n"
			if (is_prime(potential_factor))
				return potential_factor
			end
		end
	end

	return 1
end

n = 600851475143
print "Largest prime factor of " + n.to_s + " is " + largest_prime_factor(n).to_s

